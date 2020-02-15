//
//  DIItem+CustomStringConvertible.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 09/06/2019.
//

extension DIContainer.Item: CustomStringConvertible {

    // MARK: - functions

    public var description: String {
        let parameters: [String] = types.enumerated().compactMap({ "parameter\($0): \($1)" })
        return "func factory(\(parameters.joined(separator: ", "))) -> \(protocolType)"
    }
}
