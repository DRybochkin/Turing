//
//  SafeValue+Codable.swift
//  TuringSafeValue
//
//  Created by Dmitry Rybochkin on 18/04/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation

extension SafeValue: Encodable where Value: Encodable {

    // MARK: - Types

    private enum CodingKeys: String, CodingKey {
        case array
    }

    // MARK: - Functions

    public func encode(to encoder: Encoder) throws {
        dispatchQueue.sync(flags: .barrier) {
            try? safeValue.encode(to: encoder)
        }
    }
}

extension SafeValue: Decodable where Value: Decodable {

    // MARK: - Initialization

    public convenience init(from decoder: Decoder) throws {
        let decodedValue = try Value(from: decoder)
        self.init(decodedValue)
    }
}
