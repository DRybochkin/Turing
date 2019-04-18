//
//  TestTuringErrorSpec.swift
//  TuringErrorImplementation_Tests
//
//  Created by Dmitry Rybochkin on 11/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringError
import TuringErrorInterface

class TestTuringErrorSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {

            let simpleError = TuringError<TestErrorCode>(code: .error0)
            it("test simple error path") {
                expect(simpleError.path) == "TE0"
            }
            it("test simple error description") {
                expect(simpleError.description) == "TestError.error0"
            }

            let coupleError = TuringError<TestErrorCode>(code: .error404, underlying: simpleError)
            it("test couple error path") {
                expect(coupleError.path) == "TE404-TE0"
            }
            it("test couple error description") {
                expect(coupleError.description) == "TestError.error404-TestError.error0"
            }

            let tripleError = TuringError<TestErrorCode>(code: .error2, underlying: coupleError)
            it("test triple error path") {
                expect(tripleError.path) == "TE2-TE404-TE0"
            }
            it("test triple error description") {
                expect(tripleError.description) == "TestError.error2-TestError.error404-TestError.error0"
            }

            var nsError: TuringErrorProtocol?
            if let url = URL(string: "http://turing.ru") {
                let task = URLSession.shared.dataTask(with: url, completionHandler: { _, _, error in
                    guard let error = error as NSError? else {
                        return
                    }
                    nsError = TuringError<TestErrorCode>(code: .error1, underlying: error)
                })
                task.resume()
            }

            it("test couple error with network") {
                waitUntil { done in
                    Thread.sleep(forTimeInterval: 0.5)
                    expect(nsError?.path) == "TE1-NSURLErrorDomain(-1022)"
                    expect(nsError?.description) == "TestError.error1-NSURLErrorDomain.(-1022)"
                    done()
                }
            }
        }
    }
}
