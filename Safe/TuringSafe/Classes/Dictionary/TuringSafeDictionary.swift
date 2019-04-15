//
//  TuringSafeDictionary.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

public final class TuringSafeDictionary<Key: Hashable, Value: Any>: Collection, ExpressibleByDictionaryLiteral {

    // MARK: - Types

    public typealias DictionaryType = Dictionary<Key, Value>
    public typealias Indices = DictionaryType.Indices
    public typealias Iterator = DictionaryType.Iterator
    public typealias SubSequence = DictionaryType.SubSequence
    public typealias Index = DictionaryType.Index

    // MARK: - Properties

    private let dispatchQueue: DispatchQueue
    private var dictionary: DictionaryType = [:]
    public var startIndex: Index {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.startIndex
        }
    }
    public var endIndex: DictionaryType.Index {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.endIndex
        }
    }
    public subscript(position: Index) -> Iterator.Element {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary[position]
        }
    }
    public subscript(bounds: Range<Index>) -> SubSequence {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary[bounds]
        }
    }
    public var indices: Indices {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.indices
        }
    }
    public subscript(key: Key) -> Value? {
        get {
            return dispatchQueue.sync(flags: .barrier) {
                dictionary[key]
            }
        }
         set {
            dispatchQueue.async(flags: .barrier) { [weak self] in
                self?.dictionary[key] = newValue
            }
        }
    }
    public func index(after index: Index) -> Index {
       return dispatchQueue.sync(flags: .barrier) {
            dictionary.index(after: index)
        }
    }

    public func makeIterator() -> DictionaryIterator<Key, Value> {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.makeIterator()
        }
    }

    public func removeValue(forKey key: Key) {
        dispatchQueue.async(flags: .barrier) { [weak self] in
            self?.dictionary.removeValue(forKey: key)
        }
    }

    public func removeAll() {
        dispatchQueue.async(flags: .barrier) { [weak self] in
            self?.dictionary.removeAll()
        }
    }

    // MARK: - Constructors

    public init(isConcurrent: Bool) {
        let queueLabel = "TuringSafeDictionary<\(Key.self), \(Value.self)>.DispatchQueue.\(UUID().uuidString)"
        dispatchQueue = isConcurrent ? DispatchQueue(label: queueLabel, attributes: .concurrent) : DispatchQueue(label: queueLabel)
    }

    public convenience init() {
        self.init(isConcurrent: true)
    }

    public convenience init(dictionaryLiteral elements: (Key, Value)...) {
        self.init(isConcurrent: true)
        elements.forEach({ dictionary[$0.0] = $0.1 })
    }

    // MARK: - Life cycle

    deinit {
        removeAll()
    }
}
