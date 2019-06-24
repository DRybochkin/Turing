//
//  TestDIZeroParametersSpec.swift
//  TuringDI_Tests
//
//  Created by Dmitry Rybochkin on 17/04/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import Quick
import Nimble
import TuringDI

final class TestDIZeroParametersSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test init") {
                _ = DIContainer(maxRecursiveDepth: 10)
                expect("init") == "init"
            }
            it("test register/resolve zero parameters ") {
                let diContainer = DIContainer(maxRecursiveDepth: 10)
                diContainer.register(ParentProtocol.self, factory: { ParentClass() })
                guard let parent1: ParentProtocol = diContainer.resolve() else {
                    expect("resolve") == "fail"
                    return
                }
                guard let parent2 = diContainer.resolve(ParentProtocol.self) else {
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
            it("test register/resolve singletone zero parameters ") {
                let diContainer = DIContainer(maxRecursiveDepth: 10)
                diContainer.register(ParentProtocol.self, factory: { ParentClass() })
                guard let parent1: ParentProtocol = diContainer.resolveSingletone() else {
                    expect("resolve") == "fail"
                    return
                }
                guard let parent2 = diContainer.resolveSingletone(ParentProtocol.self) else {
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
}
