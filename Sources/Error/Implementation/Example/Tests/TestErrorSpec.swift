//
//  TestErrorSpec.swift
//  TuringError_Tests
//
//  Created by Dmitry Rybochkin on 11/04/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation
import Quick
import Nimble
import TuringError
import TuringErrorInterface

class TestErrorSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            checkSingleError()
            checkCoupleError()
            checkTripleError()
            checkNetworkError()
            checkSingleErrorWithUserInfo()
            checkCoupleErrorWithOneUserInfo()
            checkCoupleErrorWithTwoUserInfo()
        }
    }
}

private extension TestErrorSpec {

    // MARK: - Private functions

    private func checkSingleError() {
        let simpleError = TestError.error0.error
        it("test simple error path") {
            expect(simpleError.path) == "TE0"
        }
        it("test simple error description") {
            expect(simpleError.description) == "TestError.error0"
        }
        it("test simple error userInfo") {
            expect(simpleError.underlyingUserInfo).to(beNil())
        }
    }

    private func checkCoupleError() {
        let simpleError = TestError.error0.error
        let coupleError = TestError.error404.error.underlying(simpleError)
        it("test couple error path") {
            expect(coupleError.path) == "TE404-TE0"
        }
        it("test couple error description") {
            expect(coupleError.description) == "TestError.error404-TestError.error0"
        }
        it("test couple error userInfo") {
            expect(simpleError.underlyingUserInfo).to(beNil())
        }
    }

    private func checkTripleError() {
        let simpleError = TestError.error0.error
        let coupleError = TestError.error404.error.underlying(simpleError)
        let tripleError = TestError.error2.error.underlying(coupleError)
        it("test triple error path") {
            expect(tripleError.path) == "TE2-TE404-TE0"
        }
        it("test triple error description") {
            expect(tripleError.description) == "TestError.error2-TestError.error404-TestError.error0"
        }
        it("test triple error userInfo") {
            expect(simpleError.underlyingUserInfo).to(beNil())
        }
    }

    private func checkNetworkError() {
        it("test couple error with network") {
            let description = "TestError.error2-TestError.error404-TestError.error0-NSURLErrorDomain.NSError"
            waitUntil(timeout: 0.5, action: { done in
                guard let url = URL(string: "http://turing.ru") else {
                    expect(false) == true
                    done()
                    return
                }
                let task = URLSession.shared.dataTask(with: url, completionHandler: { _, _, error in
                    guard let error = error as NSError? else {
                        expect(false) == true
                        done()
                        return
                    }
                    let baseError = TestError.error0.error.underlying(error)
                    let secondError = TestError.error404.error.underlying(baseError)
                    let nsError = TestError.error2.error.underlying(secondError)
                    #if SWIFT_PACKAGE
                    expect(nsError.path) == "TE2-TE404-TE0-NSE-1003"
                    #else
                    expect(nsError.path) == "TE2-TE404-TE0-NSE-1022"
                    #endif

                    expect(nsError.description.starts(with: description)) == true
                    done()
                })
                task.resume()
            })
        }
    }

    private func checkSingleErrorWithUserInfo() {
        let errorWithUserInfo = TestError.error404.error.info(["testKey": 12])
        it("test error with user info path") {
            expect(errorWithUserInfo.path) == "TE404"
        }
        it("test error with user info description") {
            expect(errorWithUserInfo.description) == "TestError.error404"
        }
        it("test error with user info userInfo") {
            expect(errorWithUserInfo.underlyingUserInfo?["TE404"] as? [String: Int]) == ["testKey": 12]
        }
    }

    private func checkCoupleErrorWithOneUserInfo() {
        let errorUnderlyingWithUserInfo = TestError.error404.error
            .underlying(TestError.error0.error.info(["testKey": 12]))
        it("test error with one user info path") {
            expect(errorUnderlyingWithUserInfo.path) == "TE404-TE0"
        }
        it("test error with one user info description") {
            expect(errorUnderlyingWithUserInfo.description) == "TestError.error404-TestError.error0"
        }
        it("test error with one user info userInfo") {
            expect(errorUnderlyingWithUserInfo.underlyingUserInfo?["TE0"] as? [String: Int]) == ["testKey": 12]
            expect(errorUnderlyingWithUserInfo.underlyingUserInfo?["TE404"]).to(beNil())
        }

        let errorUnderlyingWithUserInfo1 = TestError.error404.error
            .underlying(TestError.error0.error).info(["testKey": 12])
        it("test error with one user info path") {
            expect(errorUnderlyingWithUserInfo1.path) == "TE404-TE0"
        }
        it("test error with one user info description") {
            expect(errorUnderlyingWithUserInfo1.description) == "TestError.error404-TestError.error0"
        }
        it("test error with one user info userInfo") {
            expect(errorUnderlyingWithUserInfo1.underlyingUserInfo?["TE404"] as? [String: Int]) == ["testKey": 12]
            expect(errorUnderlyingWithUserInfo1.underlyingUserInfo?["TE0"]).to(beNil())
        }
    }

    private func checkCoupleErrorWithTwoUserInfo() {
        let coupleErrorUnderlyingWithUserInfo = TestError.error404.error
            .underlying(TestError.error0.error.info(["testKey": 12])).info(["testKey1": 200])
        it("test error with two user info path") {
            expect(coupleErrorUnderlyingWithUserInfo.path) == "TE404-TE0"
        }
        it("test error with two user info description") {
            expect(coupleErrorUnderlyingWithUserInfo.description) == "TestError.error404-TestError.error0"
        }
        it("test error with two user info userInfo") {
            let testUserInfo1 = coupleErrorUnderlyingWithUserInfo.underlyingUserInfo?["TE404"] as? [String: Int]
            expect(testUserInfo1) == ["testKey1": 200]
            let testUserInfo2 = coupleErrorUnderlyingWithUserInfo.underlyingUserInfo?["TE0"] as? [String: Int]
            expect(testUserInfo2) == ["testKey": 12]
        }
    }
}
