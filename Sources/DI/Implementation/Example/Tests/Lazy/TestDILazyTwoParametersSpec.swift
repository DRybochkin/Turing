//
//  TestDILazyTwoParametersSpec.swift
//  TuringDI_Tests
//
//  Created by Dmitry Rybochkin on 22/04/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import Quick
import Nimble
import TuringDI
import TuringDIInterface

final class TestDILazyTwoParametersSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            optionalParameter()
            unwrappedParameter()
            singletoneOptionalParameter()
            singletoneUnwrappedParameter()
        }
    }
}

private extension TestDILazyTwoParametersSpec {

    // MARK: - Private functions

    private func optionalParameter() {
        it("test register/resolve two optional parameters") {
            let diContainer: DIProtocol = DIContainer(maxRecursiveDepth: 10)
            diContainer.register(ChildProtocol.self, factory: { ChildClass() })
            diContainer.register(ParentProtocol.self, factory: { ParentClass(property1: $1, property2: $2) })

            let lazyChild1: DILazy<ChildProtocol>? = diContainer.lazyResolve(ChildProtocol.self)
            expect(lazyChild1).notTo(beNil())
            let child1 = lazyChild1?.instance
            expect(child1).notTo(beNil())

            let lazyParent1: DILazy<ParentProtocol>? = diContainer.lazyResolve(ParentProtocol.self, child1, 10)
            expect(lazyParent1).notTo(beNil())
            let lazyParent2: DILazy<ParentProtocol>? = diContainer.lazyResolve(ParentProtocol.self, child1, 10)
            expect(lazyParent2).notTo(beNil())

            guard let parent1: ParentProtocol = lazyParent1?.instance else {
                expect("resolve parent") == "fail"
                return
            }
            guard let parent2 = lazyParent2?.instance else {
                expect("resolve child") == "fail"
                return
            }

            expect(parent1.property1 === parent2.property1) == true
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

    private func unwrappedParameter() {
        it("test register/resolve two unwrapped parameters") {
            let diContainer: DIProtocol = DIContainer(maxRecursiveDepth: 10)
            diContainer.register(ChildProtocol.self, factory: { ChildClass() })
            diContainer.register(ParentProtocol.self, factory: { ParentClass(property1: $1, property2: $2) })

            let lazyChild1: DILazy<ChildProtocol>? = diContainer.lazyResolve(ChildProtocol.self)
            expect(lazyChild1).notTo(beNil())
            guard let child1: ChildProtocol = lazyChild1?.instance else {
                expect("resolve child") == "fail"
                return
            }
            let lazyParent1: DILazy<ParentProtocol>? = diContainer.lazyResolve(ParentProtocol.self, child1, 10)
            expect(lazyParent1).notTo(beNil())
            let lazyParent2: DILazy<ParentProtocol>? = diContainer.lazyResolve(ParentProtocol.self, child1, 10)
            expect(lazyParent2).notTo(beNil())

            guard let parent1: ParentProtocol = lazyParent1?.instance else {
                expect("resolve parent") == "fail"
                return
            }
            guard let parent2 = lazyParent2?.instance else {
                expect("resolve parent") == "fail"
                return
            }

            expect(parent1.property1 === parent2.property1) == true
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

    private func singletoneOptionalParameter() {
        it("test register/resolve singletone two optional parameters ") {
            let resolver: DIProtocol = DIContainer(maxRecursiveDepth: 10)
            resolver.register(ChildProtocol.self, factory: { ChildClass() })
            resolver.register(ParentProtocol.self, factory: { ParentClass(property1: $1, property2: $2) })

            let lazyChild1: DILazy<ChildProtocol>? = resolver.lazyResolveSingletone(ChildProtocol.self)
            expect(lazyChild1).notTo(beNil())
            let child1 = lazyChild1?.instance
            expect(child1).notTo(beNil())
            let lazyChild2: DILazy<ChildProtocol>? = resolver.lazyResolveSingletone(ChildProtocol.self)
            expect(lazyChild2).notTo(beNil())
            let child2 = lazyChild2?.instance
            expect(child2).notTo(beNil())

            let lazyParent1: DILazy<ParentProtocol>? = resolver.lazyResolveSingletone(ParentProtocol.self, child1, 10)
            expect(lazyParent1).notTo(beNil())
            let lazyParent2: DILazy<ParentProtocol>? = resolver.lazyResolveSingletone(ParentProtocol.self, child2, 10)
            expect(lazyParent2).notTo(beNil())

            guard let parent1: ParentProtocol = lazyParent1?.instance else {
                expect("resolve parent") == "fail"
                return
            }
            guard let parent2 = lazyParent2?.instance else {
                expect("resolve child") == "fail"
                return
            }

            expect(parent1.property1 === parent2.property1) == true
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

    private func singletoneUnwrappedParameter() {
        it("test register/resolve singletone two parameters") {
            let resolver: DIProtocol = DIContainer(maxRecursiveDepth: 10)
            resolver.register(ChildProtocol.self, factory: { ChildClass() })
            resolver.register(ParentProtocol.self, factory: { ParentClass(property1: $1, property2: $2) })

            let lazyChild1: DILazy<ChildProtocol>? = resolver.lazyResolveSingletone(ChildProtocol.self)
            expect(lazyChild1).notTo(beNil())
            guard let child1: ChildProtocol = lazyChild1?.instance else {
                expect("resolve child") == "fail"
                return
            }
            let lazyChild2: DILazy<ChildProtocol>? = resolver.lazyResolveSingletone(ChildProtocol.self)
            expect(lazyChild2).notTo(beNil())
            guard let child2: ChildProtocol = lazyChild2?.instance else {
                expect("resolve child") == "fail"
                return
            }

            let lazyParent1: DILazy<ParentProtocol>? = resolver.lazyResolveSingletone(ParentProtocol.self, child1, 10)
            expect(lazyParent1).notTo(beNil())
            let lazyParent2: DILazy<ParentProtocol>? = resolver.lazyResolveSingletone(ParentProtocol.self, child2, 10)
            expect(lazyParent2).notTo(beNil())

            guard let parent1: ParentProtocol = lazyParent1?.instance else {
                expect("resolve parent") == "fail"
                return
            }
            guard let parent2 = lazyParent2?.instance else {
                expect("resolve child") == "fail"
                return
            }

            expect(parent1.property1 === parent2.property1) == true
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
