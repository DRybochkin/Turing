//
//  Value+Device.swift
//  TuringValue
//
//  Created by Dmitry Rybochkin on 14/06/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import CoreGraphics
import Foundation
import Quick
import Nimble
import TuringValue
import UIKit

final class TestValueSpec: QuickSpec {

    // MARK: - Types

    typealias Value = Double

    // MARK: - Properties

    private let value = TuringValue<Value>(default: 100)
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

    override func spec() {
        describe("these will success \(Device.version())") {
            switch Device.version() {
            case .iPad1, .iPad2, .iPad3, .iPad4, .iPad5, .iPad6, .iPadAir, .iPadAir2:
                it("test ipad") {
                    self.checkValue(portrait: 201, landscape: 211)
                    self.checkStringValue(portrait: "ipadsTestStr", landscape: "landscapeIpadsTestStr")
                }
            case .iPadMini, .iPadMini2, .iPadMini3, .iPadMini4:
                it("test ipad mini") {
                    self.checkValue(portrait: 201, landscape: 211)
                    self.checkStringValue(portrait: "ipadsTestStr", landscape: "landscapeIpadsTestStr")
                }
            case .iPadPro10_5Inch, .iPadPro12_9Inch, .iPadPro9_7Inch:
                it("test ipad pro") {
                    self.checkValue(portrait: 202, landscape: 212)
                    self.checkStringValue(portrait: "ipadsTestStr", landscape: "landscapeIpadsTestStr")
                }
            case .iPhone4, .iPhone4S:
                it("test iphone 4") {
                    self.checkValue(portrait: 50, landscape: 51)
                    self.checkStringValue(portrait: "defaultTestStr", landscape: "landscapeIphonesTestStr")
                }
            case .iPhone5, .iPhone5C, .iPhone5S, .iPhoneSE:
                it("test iphone 5/se") {
                    self.checkValue(portrait: 101, landscape: 111)
                    self.checkStringValue(portrait: "defaultTestStr", landscape: "landscapeIphonesTestStr")
                }
            case .iPhone6, .iPhone6S, .iPhone7, .iPhone8:
                it("test iphone 6/7/8") {
                    self.checkValue(portrait: 102, landscape: 112)
                    self.checkStringValue(portrait: "defaultTestStr", landscape: "landscapeIphonesTestStr")
                }
            case .iPhone6Plus, .iPhone6SPlus, .iPhone7Plus, .iPhone8Plus:
                it("test iphone 6/7/8 plus") {
                    self.checkValue(portrait: 103, landscape: 113)
                    self.checkStringValue(portrait: "defaultTestStr", landscape: "landscapeIphonesTestStr")
               }
            case .iPhoneX, .iPhoneXR, .iPhoneXS, .iPhoneXS_Max, .iPhone11Pro_Max:
                it("test iphone X/XR/XS") {
                    self.checkValue(portrait: 104, landscape: 114)
                    self.checkStringValue(portrait: "defaultTestStr", landscape: "landscapeIphonesTestStr")
                }
            case .simulator:
                checkSimulator()
            default:
                it("test \(Device.version())") {
                    expect(false) == true
                }
            }
        }
    }
}

private extension TestValueSpec {

    // MARK: - Private function

    private func checkValue(portrait: Value, landscape: Value) {
        let orientation: UIDeviceOrientation
        #if SWIFT_PACKAGE
        orientation = .portrait
        #else
        orientation = UIDevice.current.orientation
        #endif
        switch orientation {
        case .unknown, .faceDown, .faceUp:
            expect(false) == true
        case .landscapeLeft, .landscapeRight:
            expect(self.value.get()) == landscape
            expect(self.value.get()) == self.value.get(for: .landscape)
        case .portrait, .portraitUpsideDown:
            expect(self.value.get()) == portrait
            expect(self.value.get()) == self.value.get(for: .portrait)
        @unknown default:
            expect(false) == true
        }
    }

    private func checkStringValue(portrait: String, landscape: String) {
        let orientation: UIDeviceOrientation
        #if SWIFT_PACKAGE
        orientation = .portrait
        #else
        orientation = UIDevice.current.orientation
        #endif
        switch orientation {
        case .unknown, .faceDown, .faceUp:
            expect(false) == true
        case .landscapeLeft, .landscapeRight:
            expect(self.stringValue.get()) == landscape
            expect(self.stringValue.get()) == self.stringValue.get(for: .landscape)
        case .portrait, .portraitUpsideDown:
            expect(self.stringValue.get()) == portrait
            expect(self.stringValue.get()) == self.stringValue.get(for: .portrait)
        @unknown default:
            expect(false) == true
        }
    }

    private func checkSimulator() {
        switch Device.Size.size() {
        case .screen10_5Inch, .screen12_9Inch:
            it("test ipad pro") {
                self.checkValue(portrait: 202, landscape: 212)
                self.checkStringValue(portrait: "defaultTestStr", landscape: "landscapeIphonesTestStr")
            }
        case .screen7_9Inch, .screen9_7Inch:
            it("test ipad") {
                self.checkValue(portrait: 201, landscape: 211)
                self.checkStringValue(portrait: "defaultTestStr", landscape: "landscapeIphonesTestStr")
            }
        case .screen6_1Inch, .screen6_5Inch, .screen5_8Inch:
            it("test iphone X/XR/XS") {
                self.checkValue(portrait: 104, landscape: 114)
                self.checkStringValue(portrait: "defaultTestStr", landscape: "landscapeIphonesTestStr")
            }
        case .screen4Inch:
            it("test iphone 5/se") {
                self.checkValue(portrait: 101, landscape: 111)
                self.checkStringValue(portrait: "defaultTestStr", landscape: "landscapeIphonesTestStr")
            }
        case .screen4_7Inch:
            it("test iphone 6/7/8") {
                self.checkValue(portrait: 102, landscape: 112)
                self.checkStringValue(portrait: "defaultTestStr", landscape: "landscapeIphonesTestStr")
            }
        case .screen3_5Inch:
            it("test iphone 4") {
                self.checkValue(portrait: 50, landscape: 51)
                self.checkStringValue(portrait: "defaultTestStr", landscape: "landscapeIphonesTestStr")
            }
        case .screen5_5Inch:
            it("test iphone 6/7/8 plus") {
                self.checkValue(portrait: 103, landscape: 113)
                self.checkStringValue(portrait: "defaultTestStr", landscape: "landscapeIphonesTestStr")
            }
        default:
            it("test \(Device.version()) \(Device.Size.size())") {
                expect(false) == true
            }
        }
    }
}
