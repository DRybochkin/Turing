//
//  ViewController.swift
//  TuringError
//
//  Created by Dmitry Rybochkin on 04/11/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import TuringError
import TuringErrorInterface
import UIKit

final class ViewController: UIViewController {

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let errorUnderlyingWithUserInfo = ViewControllerError.error404.error
            .underlying(ViewControllerError.error0.error.info(["testKey": 12])).info(["testKey1": 12.13])
        print(errorUnderlyingWithUserInfo.underlyingUserInfo ?? ["nil": "nil"])

        let baseError = ViewControllerError.error0
        let error = ViewControllerError.error1.error.underlying(baseError.error)
        print("TuringError=>", error.path)
        print("TuringError=>", error.description)

        let error1 = ViewControllerError.error1.error
        print("TuringError=>", error1.path)
        print("TuringError=>", error1.description)

        let nsError = ViewControllerError.error2.error.underlying(NSError(domain: "NetworkError",
                                                                    code: 409,
                                                                    userInfo: nil))
        print("TuringError=>", nsError.path)
        print("TuringError=>", nsError.description)

        guard let url = URL(string: "http://turing.ru") else {
            return
        }
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request, completionHandler: { _, _, error in
            guard let error = error else {
                return
            }
            let nsError = ViewControllerError.error2.error.underlying(error)
            print("TuringError=>", nsError.path)
            print("TuringError=>", nsError.description)
            print("TuringError=>", nsError.debugDescription)
        })

        task.resume()
    }
}


private extension ViewController {

    // MARK: - Types

    private enum ViewControllerError: Int, ErrorCodeProtocol, ErrorConvertible {

        // MARK: - Cases

        case error0
        case error1
        case error2
        case error404 = 404

        // MARK: - Properties

        static var domain: String = "ViewController"
        static var domainCode: String = "TVC"
    }
}
