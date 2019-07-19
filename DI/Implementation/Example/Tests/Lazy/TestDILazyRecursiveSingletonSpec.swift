//
//  TestDILazyRecursiveSingletonSpec.swift
//  TuringDI_Example
//
//  Created by Dmitry Rybochkin on 05/06/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import Quick
import Nimble
import TuringDI
import TuringDIInterface

final class TestDILazyRecursiveSingletonSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            recursiveErrorNotResolved()
            recursiveErrorResolved()
        }
    }
}

private extension TestDILazyRecursiveSingletonSpec {

    // MARK: - Private functions

    private func recursiveErrorNotResolved() {
        it("test register/resolve recurcive not resolved") {
            let diContainer: DIProtocol = DIContainer(maxRecursiveDepth: 10)
            diContainer.register(RecurciveAProtocol.self, factory: { RecurciveA(di: $0) })
            diContainer.register(RecurciveBProtocol.self, factory: { RecurciveB(di: $0) })
            let lazyRecurciveA: DILazy<RecurciveAProtocol>? = diContainer.lazyResolveSingletone(RecurciveAProtocol.self)
            expect(lazyRecurciveA).notTo(beNil())
            let recurciveA: RecurciveAProtocol? = lazyRecurciveA?.instance
            expect(recurciveA).to(beNil())
        }
    }

    private func recursiveErrorResolved() {
        it("test register/resolve recurcive resolved") {
            let diContainer: DIProtocol = DIContainer(maxRecursiveDepth: 10)
            diContainer.register(RecurciveAProtocol.self, factory: { RecurciveA(diContainer: $0) })
            diContainer.register(RecurciveBProtocol.self, factory: { RecurciveB(diContainer: $0) })
            let lazyRecurciveA: DILazy<RecurciveAProtocol>? = diContainer.lazyResolveSingletone(RecurciveAProtocol.self)
            expect(lazyRecurciveA).notTo(beNil())
            let recurciveA: RecurciveAProtocol? = lazyRecurciveA?.instance
            expect(recurciveA).notTo(beNil())
        }
    }
}
