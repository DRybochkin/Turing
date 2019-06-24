//
//  ViewController.swift
//  TuringUserDefaultsService
//
//  Created by drybochkin on 06/12/2019.
//  Copyright (c) 2019 drybochkin. All rights reserved.
//

import TuringStorageServiceInterface
import TuringUserDefaultsService
import UIKit

final class ViewController: UIViewController {

    // MARK: - Properties

    private let storageService: StorageServiceProtocol = UserDefaultsService()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let testString = "testString"
        switch storageService.save(value: testString, for: StorageKey.testStringKey) {
        case .success:
            let value = storageService.value(String.self, for: StorageKey.testStringKey)
            switch value {
            case .success(let value):
                print(testString == value)
            case .failure(let error):
                print(error.description)
            }
        case .failure(let error):
            print(error.description)
        }

        let testNilBool: Bool? = nil
        switch storageService.save(value: testNilBool, for: StorageKey.testBoolKey) {
        case .failure(let error):
            print(error.description)
        case .success:
            let value = storageService.value(Bool.self, for: StorageKey.testBoolKey)
            switch value {
            case .success(let value):
                print(testNilBool == value)
            case .failure(let error):
                print(error.description)
            }
        }

        let testData: Data? = Data(testString.utf8)
        switch storageService.save(value: testData, for: StorageKey.testDataKey) {
        case .failure(let error):
            print(error.description)
        case .success:
            let value = storageService.value(Data.self, for: StorageKey.testDataKey)
            switch value {
            case .success(let value):
                print(testData == value)
            case .failure(let error):
                print(error.description)
            }
        }

        let testURL: URL? = URL(string: "https://www.turing.ru")
        switch storageService.save(value: testURL, for: StorageKey.testUrlKey) {
        case .failure(let error):
            print(error.description)
        case .success:
            let value = storageService.value(URL.self, for: StorageKey.testUrlKey)
            switch value {
            case .success(let value):
                print(testURL == value)
            case .failure(let error):
                print(error.description)
            }
        }

        let testObject = TestObject(string: "tos", integer: 101)
        switch storageService.save(value: testObject, for: StorageKey.testObjectKey) {
        case .success:
            let value = storageService.value(TestObject.self, for: StorageKey.testObjectKey)
            switch value {
            case .success(let value):
                print(value == testObject)
            case .failure(let error):
                print(error.description)
            }
        case .failure(let error):
            print(error.description)
        }

        let testArray = [TestObject(string: "tos", integer: 101), TestObject(string: "tos1", integer: 102)]
        switch storageService.save(value: testArray, for: StorageKey.testArrayKey) {
        case .success:
            let value = storageService.value([TestObject].self, for: StorageKey.testArrayKey)
            switch value {
            case .success(let value):
                print(value == testArray)
            case .failure(let error):
                print(error.description)
            }
        case .failure(let error):
            print(error.description)
        }

        let testStringArray = ["tsa1", "tsa2", "tsa3"]
        switch storageService.save(value: testStringArray, for: StorageKey.testStringArrayKey) {
        case .success:
            let value = storageService.value([String].self, for: StorageKey.testStringArrayKey)
            switch value {
            case .success(let value):
                print(value == testStringArray)
            case .failure(let error):
                print(error.description)
            }
        case .failure(let error):
            print(error.description)
        }
    }
}

private struct TestObject: Codable, Equatable {
    var string: String
    var integer: Int
}

extension ViewController {

    private enum StorageKey: String, StorageServiceKeyProtocol {
        case testStringKey
        case testBoolKey
        case testFloatKey
        case testIntKey
        case testDoubleKey
        case testUrlKey
        case testStringArrayKey
        case testArrayKey
        case testDataKey
        case testDictionaryKey
        case testObjectKey
    }
}
