//
//  TestDILazyFactorySpec.swift
//  TuringDI_Example
//
//  Created by Dmitry Rybochkin on 26.11.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringDI
import TuringDIInterface

final class TestDILazyFactorySpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            checkInit()
            checkInstance()
            checkInstantiate()
        }
    }
}

private extension TestDILazyFactorySpec {

    // MARK: - Private functions

    private func checkInit() {
        it("test init") {
            let diContainer: DIProtocol = DIContainer(maxRecursiveDepth: 10)
            expect(diContainer).notTo(beNil())
        }
    }

    private func checkInstance() {
        it("test Instance") {
            let diContainer: DIProtocol = DIContainer(maxRecursiveDepth: 10)
            diContainer.register(ChildProtocol.self, factory: { ChildClass() })
            let lazyObject = diContainer.lazyResolve(ChildProtocol.self)
            expect(lazyObject).toNot(beNil())
            expect(lazyObject.instance).toNot(beNil())
            expect(lazyObject.instance) === lazyObject.instance
        }
    }

    private func checkInstantiate() {
        it("test Instantiate") {
            let diContainer: DIProtocol = DIContainer(maxRecursiveDepth: 10)
            diContainer.register(ChildProtocol.self, factory: { ChildClass() })
            let lazyObject = diContainer.lazyResolve(ChildProtocol.self)
            expect(lazyObject).toNot(beNil())
            expect(lazyObject.instance).toNot(beNil())
            expect(lazyObject.instantiate()) !== lazyObject.instantiate()
            expect(lazyObject.instantiate()).toNot(beNil())
        }
    }
}
