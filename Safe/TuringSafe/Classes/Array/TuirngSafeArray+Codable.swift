//
//  TuirngSafeArray+Codable.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeArray : Encodable where Element : Encodable {

    // MARK: - Functions

    public func encode(to encoder: Encoder) throws {
        dispatchQueue.async(flags: .barrier) { [weak self] in
            try? self?.array.encode(to: encoder)
        }
    }
}

extension TuringSafeArray : Decodable where Element : Decodable {

    // MARK: - Constructors

   public convenience init(from decoder: Decoder) throws {
        let elements = try Array<Value>(from: decoder)
        self.init(elements)
    }
}
