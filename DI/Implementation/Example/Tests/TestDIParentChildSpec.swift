//
//  TestDIParentChildSpec.swift
//  TuringDI_Tests
//
//  Created by Dmitry Rybochkin on 23/04/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import Quick
import Nimble
import TuringDI

final class TestDIParentChildSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            parentWithChild()
            circularParentWithChild()
            circularParentWithChildAndCompletion()
            optionalStrong()
        }
    }
}

private extension TestDIParentChildSpec {

    // MARK: - Private functions

    private func parentWithChild() {
        it("test register/resolve parent/child") {
            let diContainer = DIContainer(maxRecursiveDepth: 10)
            diContainer.register(ChildProtocol.self, factory: { ChildClass() })
            diContainer.register(ParentProtocol.self, factory: {
                ParentClass(property1: $0.resolve())
            })
            let parent: ParentProtocol? = diContainer.resolve()
            expect(parent != nil) == true
            expect(parent?.property1 != nil) == true
            expect(parent?.property1?.parent == nil) == true
        }
    }

    private func circularParentWithChild() {
        it("test register/resolve circular parent/child") {
            let diContainer = DIContainer(maxRecursiveDepth: 10)
            diContainer.register(ChildProtocol.self, factory: { ChildClass(parent: $1) })
            diContainer.register(ParentProtocol.self, factory: {
                let parent: ParentProtocol? = ParentClass()
                parent?.property1 = $0.resolve(parameter: parent)
                return parent
            })
            let parent: ParentProtocol? = diContainer.resolve()
            expect(parent === parent?.property1?.parent) == true
            expect(parent != nil) == true
            expect(parent?.property1 != nil) == true
            expect(parent?.property1?.parent != nil) == true
        }
    }

    private func circularParentWithChildAndCompletion() {
        it("test register/resolve circular parent/child completion") {
            let diContainer = DIContainer(maxRecursiveDepth: 10)
            diContainer.register(ChildProtocol.self, factory: { ChildClass(parent: $1) })
            diContainer.register(ParentProtocol.self, factory: {
                ParentClass()
            }, completion: {
                $1?.property1 = $0.resolve(parameter: $1)
            })
            let parent: ParentProtocol? = diContainer.resolve()
            expect(parent === parent?.property1?.parent) == true
            expect(parent != nil) == true
            expect(parent?.property1 != nil) == true
            expect(parent?.property1?.parent != nil) == true
        }
    }
    private func optionalStrong() {
        it("test register/resolve optional/strong") {
            let diContainer = DIContainer(maxRecursiveDepth: 10)
            diContainer.register(ChildProtocol.self, factory: { ChildClass(parent: $1) })
            let child = diContainer.resolve(ChildProtocol.self, parameter: ParentClass() as ParentProtocol)
            expect(child != nil) == true
        }
    }

}
