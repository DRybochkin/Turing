//
//  ViewController.swift
//  TuringValue
//
//  Created by drybochkin on 06/14/2019.
//  Copyright (c) 2019 drybochkin. All rights reserved.
//

import TuringValue
import UIKit

final class ViewController: UIViewController {

    // MARK: - Properties

    private let value = TuringValue<CGFloat>(default: 100)
        .ipads(201, pro: 202)
        .iphone4(50)
        .iphones(iphone5: 101, iphone6: 102, iphone6p: 103, iphonex: 104)
        .landscape()
        .iphone4(51)
        .ipads(211, pro: 212)
        .iphones(iphone5: 111, iphone6: 112, iphone6p: 113, iphonex: 114)
    private let stringValue = TuringValue(default: "defaultTestStr")
        .ipads("ipadsTestStr")
        .landscape()
        .iphones("landscapeIphonesTestStr")
        .ipads("landscapeIpadsTestStr")

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        print(" landscape 211 = \(String(describing: value.get(for: .landscape))) ")
        print(" portrait 201 = \(String(describing: value.get(for: .portrait))) ")

        let displayWidth = UIScreen.main.bounds.width
        let displayheight = UIScreen.main.bounds.height

        if displayWidth > displayheight {
            print(" default landscape \(String(describing: value.get(for: .landscape))) = \(String(describing: value.get())) ")
        } else {
            print(" default portrait \(String(describing: value.get(for: .portrait))) = \(String(describing: value.get())) ")
        }

        print("default = \(stringValue.get())")
    }
}

