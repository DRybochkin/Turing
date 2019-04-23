//
//  TestTuringDIOneParametersSpec.swift
//  TuringDI_Tests
//
//  Created by Dmitry Rybochkin on 22/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringDI

final class TestTuringDIOneParametersSpec: QuickSpec {

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

private extension TestTuringDIOneParametersSpec {

    // MARK: - Private functions

    private func optionalParameter() {
        it("test register/resolve one optional parameter ") {
            let diContainer = TuringDI(maxDepth: 10)
            diContainer.register(ChildProtocol.self, factory: { ChildClass() })
            diContainer.register(ParentProtocol.self, factory: { ParentClass(property1: $1) })
            let child1: ChildProtocol? = diContainer.resolve()
            guard let parent1: ParentProtocol = diContainer.resolve(parameter: child1) else {
                expect("resolve parent") == "fail"
                return
            }
            guard let parent2 = diContainer.resolve(ParentProtocol.self, parameter: child1) else {
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
        it("test register/resolve one unwrapped parameter ") {
            let diContainer = TuringDI(maxDepth: 10)
            diContainer.register(ChildProtocol.self, factory: { ChildClass() })
            diContainer.register(ParentProtocol.self, factory: { ParentClass(property1: $1) })
            guard let child1: ChildProtocol = diContainer.resolve() else {
                expect("resolve child") == "fail"
                return
            }
            guard let parent1: ParentProtocol = diContainer.resolve(parameter: child1) else {
                expect("resolve parent") == "fail"
                return
            }
            guard let parent2 = diContainer.resolve(ParentProtocol.self, parameter: child1) else {
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
        it("test register/resolve singletone one optional parameter ") {
            let diContainer = TuringDI(maxDepth: 10)
            diContainer.register(ChildProtocol.self, factory: { ChildClass() })
            diContainer.register(ParentProtocol.self, factory: { ParentClass(property1: $1) })
            let child1: ChildProtocol? = diContainer.resolve()
            guard let parent1: ParentProtocol = diContainer.resolveSingletone(parameter: child1) else {
                expect("resolve") == "fail"
                return
            }
            guard let parent2 = diContainer.resolveSingletone(ParentProtocol.self, parameter: child1) else {
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
        it("test register/resolve singletone one parameter ") {
            let diContainer = TuringDI(maxDepth: 10)
            diContainer.register(ChildProtocol.self, factory: { ChildClass() })
            diContainer.register(ParentProtocol.self, factory: { ParentClass(property1: $1) })
            guard let child1: ChildProtocol = diContainer.resolve() else {
                expect("resolve child") == "fail"
                return
            }
            guard let parent1: ParentProtocol = diContainer.resolveSingletone(parameter: child1) else {
                expect("resolve") == "fail"
                return
            }
            guard let parent2 = diContainer.resolveSingletone(ParentProtocol.self, parameter: child1) else {
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
