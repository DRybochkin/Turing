//
//  TuirngSafeArray+Codable.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeArray: Encodable where Element: Encodable {

    // MARK: - Types

    private enum CodingKeys: String, CodingKey {
        case array
    }

    // MARK: - Functions

    public func encode(to encoder: Encoder) throws {
        dispatchQueue.sync(flags: .barrier) {
            try? array.encode(to: encoder)
        }
    }
}

extension TuringSafeArray: Decodable where Element: Decodable {

    // MARK: - Constructors

   public convenience init(from decoder: Decoder) throws {
    let elements: [Value] = try Array(from: decoder)
        self.init(elements)
    }
}
