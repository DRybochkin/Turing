//
//  TestDIRecursiveSingletonSpec.swift
//  TuringDI_Example
//
//  Created by Dmitry Rybochkin on 05/06/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import Quick
import Nimble
import TuringDI

final class TestDIRecursiveSingletonSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            recursiveErrorNotResolved()
            recursiveErrorResolved()
        }
    }
}

private extension TestDIRecursiveSingletonSpec {

    // MARK: - Private functions

    private func recursiveErrorNotResolved() {
        it("test register/resolve recurcive error not resolved") {
            let diContainer = DIContainer(maxRecursiveDepth: 25)
            diContainer.register(RecurciveAProtocol.self, factory: { RecurciveA(di: $0) })
            diContainer.register(RecurciveBProtocol.self, factory: { RecurciveB(di: $0) })
            let recurciveA: RecurciveAProtocol? = diContainer.resolveSingletone()
            expect(recurciveA == nil) == true
        }
    }

    private func recursiveErrorResolved() {
        it("test register/resolve recurcive error resolved") {
            let diContainer = DIContainer(maxRecursiveDepth: 25)
            diContainer.register(RecurciveAProtocol.self, factory: { RecurciveA(diContainer: $0) })
            diContainer.register(RecurciveBProtocol.self, factory: { RecurciveB(diContainer: $0) })
            let recurciveA: RecurciveAProtocol? = diContainer.resolveSingletone()
            expect(recurciveA != nil) == true
        }
    }
}
