//
//  ViewController.swift
//  TuringHttpService
//
//  Created by drybochkin on 06/11/2019.
//  Copyright (c) 2019 drybochkin. All rights reserved.
//

import TuringAnyRecursive
import TuringHttpService
import TuringHttpServiceInterface
import UIKit

final class ViewController: UIViewController {

    // MARK: - Properties

    private let httpService: HttpServiceProtocol = HttpService(checkCredential: false)

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let request = StackExchangeRequest()
        let dataRequest = httpService.send(request: request, completion: { (result: Result<AnyRecursive, Error>) in
            switch result {
            case .failure(let error):
                print(error.debugDescription)
            case .success(let response):
                print(response)
            }
        })
        dataRequest?.cancel()
    }
}
