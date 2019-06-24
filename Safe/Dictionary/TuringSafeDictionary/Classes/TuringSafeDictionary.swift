//
//  TuringSafeDictionary.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

public final class TuringSafeDictionary<Key: Hashable, Value: Any>: Collection, ExpressibleByDictionaryLiteral {

    // MARK: - Types

    public typealias DictionaryType = [Key: Value]
    public typealias Indices = DictionaryType.Indices
    public typealias Iterator = DictionaryType.Iterator
    public typealias SubSequence = DictionaryType.SubSequence
    public typealias Index = DictionaryType.Index

    // MARK: - Properties

    let dispatchQueue: DispatchQueue
    var dictionary: DictionaryType = [:]

    // MARK: - Constructors

    public init(isConcurrent: Bool) {
        let queueLabel = "TuringSafeDictionary<\(Key.self), \(Value.self)>.DispatchQueue.\(UUID().uuidString)"
        if isConcurrent {
            dispatchQueue = DispatchQueue(label: queueLabel, attributes: .concurrent)
        } else {
            dispatchQueue = DispatchQueue(label: queueLabel)
        }
    }

    public convenience init() {
        self.init(isConcurrent: true)
    }

    public convenience init(dictionary elements: DictionaryType) {
        self.init()
        self.dictionary = elements
    }

    public convenience init(dictionary elements: Slice<DictionaryType>) {
        self.init()
        elements.forEach({ dictionary[$0.key] = $0.value })
    }

    public convenience init(dictionary elements: [Element]) {
        self.init()
        elements.forEach({ dictionary[$0.key] = $0.value })
    }

    public convenience init(dictionaryLiteral elements: (Key, Value)...) {
        self.init()
        elements.forEach({ dictionary[$0.0] = $0.1 })
    }

    public convenience init(minimumCapacity: Int) {
        self.init()
        dictionary = Dictionary(minimumCapacity: minimumCapacity)
    }

    public convenience init<S>(uniqueKeysWithValues keysAndValues: S) where S: Sequence, S.Element == (Key, Value) {
        self.init()
        dictionary = Dictionary(uniqueKeysWithValues: keysAndValues)
    }

    //swiftlint:disable:next line_length
    public convenience init<S>(_ keysAndValues: S, uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows where S: Sequence, S.Element == (Key, Value) {
        self.init()
        dictionary = try Dictionary(keysAndValues, uniquingKeysWith: combine)
    }

    //swiftlint:disable:next line_length
    public convenience init<S>(grouping values: S, by keyForValue: (S.Element) throws -> Key) rethrows where Value == [S.Element], S: Sequence {
        self.init()
        dictionary = try Dictionary(grouping: values, by: keyForValue)
    }

    // MARK: - Life cycle

    deinit {
        removeAll()
    }
}
