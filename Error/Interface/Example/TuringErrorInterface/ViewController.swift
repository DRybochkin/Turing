//
//  ViewController.swift
//  TuringErrorInterface
//
//  Created by drybochkin on 04/11/2019.
//  Copyright (c) 2019 drybochkin. All rights reserved.
//

import TuringErrorInterface
import UIKit

final class ViewController: UIViewController {

    // MARK: - Properties

    var error: TuringErrorProtocol = ViewControllerError(underlying: nil,
                                                         code: ErrorCode.error2,
                                                         userInfo: ["data": "data1"])
    var errorEnum: TuringEnumErrorCodeProtocol = ErrorCode.error0
    var errorCode: TuringErrorCodeProtocol = ErrorCode.error1

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        error = ViewControllerEnumError.error3(error, ["data2": "data3"])
    }
}

private extension ViewController {

    // MARK: - Errors

    enum ErrorCode: Int, TuringEnumErrorCodeProtocol {
        case error0
        case error1
        case error2
        case error3

        var path: String {
            return "\(domainCode).\(rawValue)"
        }

        var description: String {
            return "\(domain)\(self)"
        }

        var domain: String {
            return "ViewController"
        }
        var domainCode: String {
            return "VC"
        }
    }

    struct ViewControllerError: TuringErrorProtocol {
        let underlying: TuringErrorProtocol?
        let domain: String = "ViewController"
        let domainCode: String = "VC"
        let code: TuringErrorCodeProtocol
        let userInfo: Info?
        var description: String {
            return "description"
        }
        var path: String {
            return "path"
        }
    }

    enum ViewControllerEnumError: TuringErrorProtocol, TuringErrorCodeProtocol {
        case error0
        case error1(TuringErrorProtocol)
        case error2(Info)
        case error3(TuringErrorProtocol, Info)

        var rawValue: Int {
            switch self {
            case .error0:
                return 0
            case .error1:
                return 1
            case .error2:
                return 2
            case .error3:
                return 3
            }
        }

        var underlying: TuringErrorProtocol? {
            switch self {
            case .error0, .error2:
                return nil
            case .error1(let underlying), .error3(let underlying, _):
                return underlying
            }
        }

        var userInfo: Info? {
            switch self {
            case .error0, .error1:
                return nil
            case .error2(let userInfo), .error3(_, let userInfo):
                return userInfo
            }
        }

        var domain: String {
            return "ViewController"
        }

        var domainCode: String {
            return "VC"
        }

        var code: TuringErrorCodeProtocol {
            return self
        }

        var description: String {
            return "description"
        }

        var path: String {
            return "path"
        }
    }
}
