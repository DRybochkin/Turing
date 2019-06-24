//
//  UserDefaultsService.swift
//  TuringUserDefaultsService
//
//  Created by Dmitry Rybochkin on 12/06/2019.
//

import Foundation
import TuringStorageServiceInterface

public final class UserDefaultsService {

    // MARK: - Properties

    private let userDefaults: UserDefaults

    // MARK: - Initialization

    public init() {
        userDefaults = UserDefaults()
    }
}

extension UserDefaultsService: StorageServiceProtocol {

    // MARK: - Functions

    @discardableResult
    public func value<T>(_ type: T.Type, for key: StorageServiceKeyProtocol) -> Result<T, Error> {
        return .failure(ServiceError.notSupportedType.error)
    }

    @discardableResult
    public func value<T: Decodable>(_ type: T.Type, for key: StorageServiceKeyProtocol) -> Result<T, Error> {
        guard userDefaults.object(forKey: key.rawValue) != nil else {
            return .failure(ServiceError.keyNotFound.error)
        }
        switch T.self {
        case is String.Type:
            return stringValue(for: key)
        case is Bool.Type:
            return boolValue(for: key)
        case is Data.Type:
            return dataValue(for: key)
        case is Float.Type:
            return floatValue(for: key)
        case is Double.Type:
            return doubleValue(for: key)
        case is Int.Type:
            return intValue(for: key)
        case is URL.Type:
            return urlValue(for: key)
        default:
            return objectValue(for: key)
        }
    }

    @discardableResult
    public func save<T>(value: T, for key: StorageServiceKeyProtocol) -> Result<Bool, Error> {
        return .failure(ServiceError.notSupportedType.error)
    }

    @discardableResult
    public func save<T: Encodable>(value: T, for key: StorageServiceKeyProtocol) -> Result<Bool, Error> {
        if let optionalValue = value as? OptionalProtocol, optionalValue.isNil {
            return .failure(ServiceError.valueIsNil.error)
        }
        switch value {
        case let value as String:
            userDefaults.set(value, forKey: key.rawValue)
        case let value as Int:
            userDefaults.set(value, forKey: key.rawValue)
        case let value as Float:
            userDefaults.set(value, forKey: key.rawValue)
        case let value as Double:
            userDefaults.set(value, forKey: key.rawValue)
        case let value as Bool:
            userDefaults.set(value, forKey: key.rawValue)
        case let value as URL:
            userDefaults.set(value, forKey: key.rawValue)
        case let value as Data:
            userDefaults.set(value, forKey: key.rawValue)
        default:
            guard let encodedValue = try? JSONEncoder().encode(value) else {
                return .failure(ServiceError.encode.error)
            }
            userDefaults.set(encodedValue, forKey: key.rawValue)
        }
        userDefaults.synchronize()
        return .success(true)
    }

    @discardableResult
    public func delete(for key: StorageServiceKeyProtocol) -> Result<Bool, Error> {
        userDefaults.removeObject(forKey: key.rawValue)
        userDefaults.synchronize()
        return .success(true)
    }
}

private extension UserDefaultsService {

    // MARK: - Private functions

    private func stringValue<T>(for key: StorageServiceKeyProtocol) -> Result<T, Error> {
        guard let result = userDefaults.string(forKey: key.rawValue) as? T else {
            return .failure(ServiceError.valueIsNil.error)
        }
        return .success(result)
    }

    private func boolValue<T>(for key: StorageServiceKeyProtocol) -> Result<T, Error> {
        guard let result = userDefaults.bool(forKey: key.rawValue) as? T else {
            return .failure(ServiceError.valueIsNil.error)
        }
        return .success(result)
    }

    private func dataValue<T>(for key: StorageServiceKeyProtocol) -> Result<T, Error> {
        guard let result = userDefaults.data(forKey: key.rawValue) as? T else {
            return .failure(ServiceError.valueIsNil.error)
        }
        return .success(result)
    }

    private func floatValue<T>(for key: StorageServiceKeyProtocol) -> Result<T, Error> {
        guard let result = userDefaults.float(forKey: key.rawValue) as? T else {
            return .failure(ServiceError.valueIsNil.error)
        }
        return .success(result)
    }

    private func doubleValue<T>(for key: StorageServiceKeyProtocol) -> Result<T, Error> {
        guard let result = userDefaults.double(forKey: key.rawValue) as? T else {
            return .failure(ServiceError.valueIsNil.error)
        }
        return .success(result)
    }

    private func intValue<T>(for key: StorageServiceKeyProtocol) -> Result<T, Error> {
        guard let result = userDefaults.integer(forKey: key.rawValue) as? T else {
            return .failure(ServiceError.valueIsNil.error)
        }
        return .success(result)
    }

    private func urlValue<T>(for key: StorageServiceKeyProtocol) -> Result<T, Error> {
        guard let result = userDefaults.url(forKey: key.rawValue) as? T else {
            return .failure(ServiceError.valueIsNil.error)
        }
        return .success(result)
    }

    private func objectValue<T: Decodable>(for key: StorageServiceKeyProtocol) -> Result<T, Error> {
        guard let data = userDefaults.data(forKey: key.rawValue) else {
            return .failure(ServiceError.valueIsNil.error)
        }
        guard let value = try? JSONDecoder().decode(T.self, from: data) else {
            return .failure(ServiceError.decode.error)
        }
        return .success(value)
    }
}
