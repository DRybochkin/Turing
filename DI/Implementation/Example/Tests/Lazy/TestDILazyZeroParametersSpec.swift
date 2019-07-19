//
//  TestDILazyZeroParametersSpec.swift
//  TuringDI_Tests
//
//  Created by Dmitry Rybochkin on 17/04/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import Quick
import Nimble
import TuringDI
import TuringDIInterface

final class TestDILazyZeroParametersSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            checkInit()
            check()
            checkSingletone()
        }
    }
}

private extension TestDILazyZeroParametersSpec {

    // MARK: - Private functions

    private func checkInit() {
        it("test init") {
            let diContainer: DIProtocol = DIContainer(maxRecursiveDepth: 10)
            expect(diContainer).notTo(beNil())
        }
    }

    private func check() {
        it("test register/resolve zero parameters") {
            let diContainer: DIProtocol = DIContainer(maxRecursiveDepth: 10)
            diContainer.register(ParentProtocol.self, factory: { ParentClass() })

            let lazyParent1: DILazy<ParentProtocol>? = diContainer.lazyResolve(ParentProtocol.self)
            expect(lazyParent1).notTo(beNil())
            let lazyParent2: DILazy<ParentProtocol>? = diContainer.lazyResolve(ParentProtocol.self)
            expect(lazyParent2).notTo(beNil())

            guard let parent1: ParentProtocol = lazyParent1?.instance else {
                expect("resolve") == "fail"
                return
            }
            guard let parent2 = lazyParent2?.instance else {
                expect("resolve") == "fail"
                return
            }
            expect(parent1 === parent2) == false
            guard let equalParent1 = parent1 as? ParentClass else {
                expect("cast to ParentClass") == "fail"
                return
            }
            guard let equalParent2 = parent2 as? ParentClass else {
                expect("cast to ParentClass") == "fail"
                return
            }
            expect(equalParent1 == equalParent2) == true
        }
    }

    private func checkSingletone() {
        it("test register/resolve singletone zero parameters DIContainer+LazyResolve") {
            let diContainer: DIProtocol = DIContainer(maxRecursiveDepth: 10)
            diContainer.register(ParentProtocol.self, factory: { ParentClass() })

            let lazyParent1: DILazy<ParentProtocol>? = diContainer.lazyResolveSingletone(ParentProtocol.self)
            expect(lazyParent1).notTo(beNil())
            let lazyParent2: DILazy<ParentProtocol>? = diContainer.lazyResolveSingletone(ParentProtocol.self)
            expect(lazyParent2).notTo(beNil())

            guard let parent1: ParentProtocol = lazyParent1?.instance else {
                expect("resolve") == "fail"
                return
            }
            guard let parent2 = lazyParent2?.instance else {
                expect("resolve") == "fail"
                return
            }
            expect(parent1 === parent2) == true
            guard let equalParent1 = parent1 as? ParentClass else {
                expect("cast to ParentClass") == "fail"
                return
            }
            guard let equalParent2 = parent2 as? ParentClass else {
                expect("cast to ParentClass") == "fail"
                return
            }
            expect(equalParent1 == equalParent2) == true
        }
    }
}
