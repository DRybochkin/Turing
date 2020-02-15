//
//  ViewController.swift
//  TuringDI
//
//  Created by drybochkin on 04/12/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import TuringDI
import UIKit

final class ViewController: UIViewController {

    // MARK: - Private properties

    let diContainer = DIContainer()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let objcContainer = ObjcContainer(diContainer: diContainer)
        objcContainer.registerServices()
//        objcContainer.resolveServices()


        DispatchQueue.main.async {
            let swiftContainer = SwiftContainer(diContainer: self.diContainer)
            //        swiftContainer.register()
            swiftContainer.resolve()
        }

    }
}
