//
//  TuirngSafeArray+Codable.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeDictionary: Encodable where Key: Encodable, Value: Encodable {

    // MARK: - Types

    private enum CodingKeys: String, CodingKey {
        case dictionary
    }

    // MARK: - Functions

    public func encode(to encoder: Encoder) throws {
        dispatchQueue.sync(flags: .barrier) {
            try? dictionary.encode(to: encoder)
        }
    }
}

extension TuringSafeDictionary: Decodable where Key: Decodable, Value: Decodable {

    // MARK: - Constructors

   public convenience init(from decoder: Decoder) throws {
        let elements = try DictionaryType(from: decoder)
        self.init(dictionary: elements)
    }
}
