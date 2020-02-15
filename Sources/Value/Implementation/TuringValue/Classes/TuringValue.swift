//
//  TuringValue.swift
//  TuringValue
//
//  Updated by Dmitry Rybochkin on 14/06/2019.
//  Copyright © 2017 Dmitry Rybochkin. All rights reserved.
//

public final class TuringValue<T> {

    // MARK: - Types

    typealias Devices = [Device: T]
    typealias Heights = [SideLength: Devices]
    typealias Widths = [SideLength: Heights]
    typealias Orientations = [Orientation: Widths]

    // MARK: - Properties

    var fontName: String?
    var tree: Orientations = [:]
    var orientation = Orientation.any
    let defaultValue: T

    // MARK: - Initialization

    public init(default defaultValue: T) {
        self.defaultValue = defaultValue
        add(orientation, width: .any, height: .any, device: .any, value: defaultValue)
    }

    // MARK: - Functions

    func add(_ orientation: Orientation, width: SideLength, height: SideLength, device: Device, value: T) {
        if tree[orientation] == nil {
            tree[orientation] = [:]
        }
        if tree[orientation]?[width] == nil {
            tree[orientation]?[width] = [:]
        }
        if tree[orientation]?[width]?[height] == nil {
            tree[orientation]?[width]?[height] = [:]
        }

        tree[orientation]?[width]?[height]?[device] = value
    }

    func showError(message: String) {
        #if !RELEASE
        let value = "\(TuringValue.self) - error: \(message)"
        print(value)
        fatalError(value)
        #endif
    }
}
