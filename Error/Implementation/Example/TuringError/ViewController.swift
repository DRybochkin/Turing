//
//  ViewController.swift
//  TuringErrorImplementation
//
//  Created by drybochkin on 04/11/2019.
//  Copyright (c) 2019 drybochkin. All rights reserved.
//

import TuringError
import UIKit

final class ViewController: UIViewController {

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let baseError = TuringError<ErrorCode>(code: .error2)
        let error = TuringError<ErrorCode>(code: .error404, underlying: baseError)
        print(error.path)
        print(error.description)

        let error1 = TuringError<ErrorCode>(code: .error1)
        print(error1.path)
        print(error1.description)

        let nsError = TuringError<ErrorCode>(code: .error2, underlying: NSError(domain: "NetworkError", code: 409, userInfo: nil))
        print(nsError.path)
        print(nsError.description)

        guard let url = URL(string: "https://www.turing.ru") else {
            return
        }
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request, completionHandler: { _, _, error in
            guard let error = error else {
                return
            }
            let nsError = TuringError<ErrorCode>(code: .error2, underlying: error)
            print(nsError.path)
            print(nsError.description)
        })

        task.resume()
    }
}

// MARK: - Errors

private extension ViewController {

    private enum ErrorCode: Int, TuringEnumErrorCodeProtocol {

        // MARK: - Cases

        case error0
        case error1
        case error2
        case error404 = 404

        var domain: String {
            return "ViewController"
        }
        var domainCode: String {
            return "TVC"
        }
    }
}
