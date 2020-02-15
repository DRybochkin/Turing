//
//  DIContainer.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 09.04.2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation
import TuringDIInterface
import TuringSafeValue

@objc
public final class DIContainer: NSObject {

    // MARK: - Constants

    private enum Constants {
        static let maxRecursiveDepth: Int = 10
    }

    // MARK: - Properties

    var items: SafeValue<[String: DIContainer.Item]> = §[:]
    var depth: SafeValue<Int> = §0
    var maxRecursiveDepth = Constants.maxRecursiveDepth
    public static var `default`: DIProtocol = DIContainer(maxRecursiveDepth: Constants.maxRecursiveDepth)

    // MARK: - Initialization

    @objc
    public override init() {
        super.init()
        self.maxRecursiveDepth = Constants.maxRecursiveDepth
    }

    @objc
    public init(maxRecursiveDepth: Int) {
        super.init()
        self.maxRecursiveDepth = maxRecursiveDepth
    }

    // MARK: - Functions

    func hashKey(types: [Any.Type]) -> String {
        return types.compactMap({ "\($0)" }).joined(separator: "-")
    }
}

extension DIContainer: DIProtocol { }
