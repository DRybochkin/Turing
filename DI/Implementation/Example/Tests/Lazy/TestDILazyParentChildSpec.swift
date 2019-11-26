//
//  TestDILazyParentChildSpec.swift
//  TuringDI_Tests
//
//  Created by Dmitry Rybochkin on 23/04/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import Quick
import Nimble
import TuringDI
import TuringDIInterface

final class TestDILazyParentChildSpec: QuickSpec {

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

private extension TestDILazyParentChildSpec {

    // MARK: - Private functions

    private func parentWithChild() {
        it("test register/resolve parent/child") {
            let diContainer: DIProtocol = DIContainer(maxRecursiveDepth: 10)
            diContainer.register(ChildProtocol.self, factory: { ChildClass() })
            diContainer.register(ParentProtocol.self, factory: {
                ParentClass(property1: $0.resolve())
            })
            let lazyParent: DILazy<ParentProtocol>? = diContainer.lazyResolve(ParentProtocol.self)
            expect(lazyParent).notTo(beNil())
            let parent = lazyParent?.instance

            expect(parent).notTo(beNil())
            expect(parent?.property1).notTo(beNil())
            expect(parent?.property1?.parent).to(beNil())
        }
    }

    private func circularParentWithChild() {
        it("test register/resolve circular parent/child") {
            let diContainer: DIProtocol = DIContainer(maxRecursiveDepth: 10)
            diContainer.register(ChildProtocol.self, factory: { ChildClass(parent: $1) })
            diContainer.register(ParentProtocol.self, factory: {
                let parent: ParentProtocol? = ParentClass()
                parent?.property1 = $0.resolve(parent)
                return parent
            })
            let lazyParent: DILazy<ParentProtocol>? = diContainer.lazyResolve(ParentProtocol.self)
            expect(lazyParent).notTo(beNil())
            let parent = lazyParent?.instance

            expect(parent === parent?.property1?.parent) == true
            expect(parent).notTo(beNil())
            expect(parent?.property1).notTo(beNil())
            expect(parent?.property1?.parent).notTo(beNil())
        }
    }

    private func circularParentWithChildAndCompletion() {
        it("test register/resolve circular parent/child completion") {
            let diContainer: DIProtocol = DIContainer(maxRecursiveDepth: 10)
            diContainer.register(ChildProtocol.self, factory: { ChildClass(parent: $1) })
            diContainer.register(ParentProtocol.self, factory: {
                ParentClass()
            }, completion: {
                $1?.property1 = $0.resolve($1)
            })
            let lazyParent: DILazy<ParentProtocol>? = diContainer.lazyResolve(ParentProtocol.self)
            expect(lazyParent).notTo(beNil())
            let parent = lazyParent?.instance

            expect(parent === parent?.property1?.parent) == true
            expect(parent).notTo(beNil())
            expect(parent?.property1).notTo(beNil())
            expect(parent?.property1?.parent).notTo(beNil())
        }
    }
    private func optionalStrong() {
        it("test register/resolve optional/strong") {
            let diContainer: DIProtocol = DIContainer(maxRecursiveDepth: 10)
            diContainer.register(ChildProtocol.self, factory: { ChildClass(parent: $1) })
            let lazyChild: DILazy<ChildProtocol>? = diContainer.lazyResolve(ChildProtocol.self,
                                                                            ParentClass() as ParentProtocol)
            expect(lazyChild).notTo(beNil())
            let child = lazyChild?.instance
            expect(child).notTo(beNil())
        }
    }
}
