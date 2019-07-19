//
//  TestDIThreeParametersSpec.swift
//  TuringDI_Tests
//
//  Created by Dmitry Rybochkin on 22/04/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import Quick
import Nimble
import TuringDI
import TuringDIInterface

final class TestDIThreeParametersSpec: QuickSpec {

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

private extension TestDIThreeParametersSpec {

    // MARK: - Private functions

    private func optionalParameter() {
        it("test register/resolve three optional parameters") {
            let diContainer: DIProtocol = DIContainer(maxRecursiveDepth: 10)
            diContainer.register(ChildProtocol.self, factory: { ChildClass() })
            diContainer.register(ParentProtocol.self, factory: {
                ParentClass(property2: $1, property3: $2, property4: $3)
            })
            let child1: ChildProtocol? = diContainer.resolve()
            expect(child1).toNot(beNil())
            guard let parent1: ParentProtocol = diContainer.resolve(parameter1: 10,
                                                                    parameter2: "11",
                                                                    parameter3: child1) else {
                expect("resolve parent") == "fail"
                return
            }
            guard let parent2 = diContainer.resolve(ParentProtocol.self,
                                                    parameter1: 10,
                                                    parameter2: "11",
                                                    parameter3: child1) else {
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
        it("test register/resolve three unwrapped parameters") {
            let diContainer: DIProtocol = DIContainer(maxRecursiveDepth: 10)
            diContainer.register(ChildProtocol.self, factory: { ChildClass() })
            diContainer.register(ParentProtocol.self, factory: {
                ParentClass(property2: $1, property3: $2, property4: $3)
            })
            guard let child1: ChildProtocol = diContainer.resolve() else {
                expect("resolve child") == "fail"
                return
            }
            guard let parent1: ParentProtocol = diContainer.resolve(parameter1: 10,
                                                                    parameter2: "11",
                                                                    parameter3: child1) else {
                expect("resolve parent") == "fail"
                return
            }
            guard let parent2 = diContainer.resolve(ParentProtocol.self,
                                                    parameter1: 10,
                                                    parameter2: "11",
                                                    parameter3: child1) else {
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

    private func singletoneOptionalParameter() {
        it("test register/resolve singletone three optional parameters ") {
            let diContainer: DIProtocol = DIContainer(maxRecursiveDepth: 10)
            diContainer.register(ChildProtocol.self, factory: { ChildClass() })
            diContainer.register(ParentProtocol.self, factory: {
                ParentClass(property2: $1, property3: $2, property4: $3)
            })
            let child1: ChildProtocol? = diContainer.resolveSingletone()
            expect(child1).toNot(beNil())
            let child2: ChildProtocol? = diContainer.resolveSingletone()
            expect(child2).toNot(beNil())
            guard let parent1: ParentProtocol = diContainer.resolveSingletone(parameter1: 10,
                                                                              parameter2: "11",
                                                                              parameter3: child1) else {
                expect("resolve") == "fail"
                return
            }
            guard let parent2 = diContainer.resolveSingletone(ParentProtocol.self,
                                                              parameter1: 10,
                                                              parameter2: "11",
                                                              parameter3: child2) else {
                expect("resolve") == "fail"
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
        it("test register/resolve singletone three parameters") {
            let diContainer: DIProtocol = DIContainer(maxRecursiveDepth: 10)
            diContainer.register(ChildProtocol.self, factory: { ChildClass() })
            diContainer.register(ParentProtocol.self, factory: {
                ParentClass(property2: $1, property3: $2, property4: $3)
            })
            guard let child1: ChildProtocol = diContainer.resolveSingletone() else {
                expect("resolve child") == "fail"
                return
            }
            guard let child2: ChildProtocol = diContainer.resolveSingletone() else {
                expect("resolve child") == "fail"
                return
            }
            guard let parent1: ParentProtocol = diContainer.resolveSingletone(parameter1: 10,
                                                                              parameter2: "11",
                                                                              parameter3: child1) else {
                expect("resolve") == "fail"
                return
            }
            guard let parent2 = diContainer.resolveSingletone(ParentProtocol.self,
                                                              parameter1: 10,
                                                              parameter2: "11",
                                                              parameter3: child2) else {
                expect("resolve") == "fail"
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
