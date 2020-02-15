//
//  StorageServiceProtocol.swift
//  TuringStorageServiceInterface
//
//  Created by Dmitry Rybochkin on 12/06/2019.
//

public protocol StorageServiceProtocol {

    // MARK: - Functions

    func value<T>(_ type: T.Type, for key: StorageServiceKeyProtocol) -> Result<T, Error>
    func value<T: Decodable>(_ type: T.Type, for key: StorageServiceKeyProtocol) -> Result<T, Error>
    @discardableResult
    func save<T>(value: T, for key: StorageServiceKeyProtocol) -> Result<Bool, Error>
    @discardableResult
    func save<T: Encodable>(value: T, for key: StorageServiceKeyProtocol) -> Result<Bool, Error>
    @discardableResult
    func delete(for key: StorageServiceKeyProtocol) -> Result<Bool, Error>
}
