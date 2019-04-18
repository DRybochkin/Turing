//
//  DI.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 09.04.2019.
//  Copyright © 2019 Turing. All rights reserved.
//

import Foundation
import TuringDIInterface
import TuringSafeValue

public class TuringDI: TuringDIProtocol {

    // MARK: - Constants

    private enum Constants {
        static let maxRecursiveDepth: Int = 10
    }

    // MARK: - Properties

    var items: TuringSafeValue<[String: TuringDI.Item]> = §[:]
    var depth: TuringSafeValue<Int> = §0
    var maxRecursiveDepth = Constants.maxRecursiveDepth
    public static var `default`: TuringDIProtocol = TuringDI(maxDepth: Constants.maxRecursiveDepth)

    // MARK: - Constructos

    public init(maxDepth: Int) {
        maxRecursiveDepth = maxDepth
    }

    // MARK: - Functions

    func hashKey(types: [Any.Type]) -> String {
        return types.compactMap({ "\($0)" }).joined(separator: "-")
    }
}
