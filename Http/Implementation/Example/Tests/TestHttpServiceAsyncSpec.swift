//
//  TestHttpServiceAsyncSpec.swift
//  TuringHttpService_Tests
//
//  Created by Dmitry Rybochkin on 11/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringAnyRecursive
import TuringHttpService
import TuringHttpServiceInterface

final class TestHttpServiceAsyncSpec: QuickSpec {

    // MARK: - Types

    typealias RAR = Result<AnyRecursive, Error>

    // MARK: - Lifecycle

    override func spec() {
        describe("these will success") {
            execSuccess()
            execCanceled()
        }
    }
}

private extension TestHttpServiceAsyncSpec {

    // MARK: - Private functions

    private func execSuccess() {
        it("test StackExchangeRequest") {
            waitUntil(timeout: 3.0, action: { done in
                let httpService: HttpServiceProtocol = HttpService(checkCredential: false)
                let request = StackExchangeRequest()
                let dataRequest: HttpDataRequestProtocol?
                dataRequest = httpService.send(request: request, completion: { (result: RAR) in
                    switch result {
                    case .failure:
                        expect(false) == true
                    case .success:
                        expect(true) == true
                    }
                    done()
                })
                expect(dataRequest).notTo(beNil())
            })
        }
    }

    private func execCanceled() {
        it("test cancel StackExchangeRequest") {
            waitUntil(timeout: 1.0, action: { done in
                let httpService: HttpServiceProtocol = HttpService(checkCredential: false)
                let request = StackExchangeRequest()
                let dataRequest: HttpDataRequestProtocol?
                dataRequest = httpService.send(request: request, completion: { (result: RAR) in
                    switch result {
                    case .failure(let error):
                        expect(error.path) == "HS0-NSE-999"
                    case .success:
                        expect(false) == true
                    }
                    done()
                })
                expect(dataRequest).notTo(beNil())
                dataRequest?.cancel()
            })
        }
    }
}
