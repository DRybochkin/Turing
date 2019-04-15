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

    private lazy var dispatchQueue: DispatchQueue = {
        let queueLabel = "TuringSafeDictionary<\(Key.self), \(Value.self)>.DispatchQueue.\(UUID().uuidString)"
        return DispatchQueue(label: queueLabel, attributes: .concurrent)
    }()
    private var dictionary: DictionaryType = [:]
    public var startIndex: Index {
        var result: Index!
        dispatchQueue.sync {
            result = dictionary.startIndex
        }
        return result
    }
    public var endIndex: DictionaryType.Index {
        var result: Index!
        dispatchQueue.sync {
            result = dictionary.endIndex
        }
        return result
    }
    public subscript(position: Index) -> Iterator.Element {
        var result: Iterator.Element!
        dispatchQueue.sync {
            result = dictionary[position]
        }
        return result
    }
    public subscript(bounds: Range<Index>) -> SubSequence {
        var result: SubSequence!
        dispatchQueue.sync {
            result = dictionary[bounds]
        }
        return result
    }
    public var indices: Indices {
        var result: Indices!
        dispatchQueue.sync {
            result = dictionary.indices
        }
        return result
    }
    public subscript(key: Key) -> Value? {
        get {
            var result: Value?
            dispatchQueue.sync {
                result = dictionary[key]
            }
            return result
        }
         set {
            dispatchQueue.async(flags: .barrier) {
                self.dictionary[key] = newValue
            }
        }
    }
    public func index(after index: Index) -> Index {
        var result: Index!
        dispatchQueue.sync {
            result = dictionary.index(after: index)
        }
        return result
    }

    public func makeIterator() -> DictionaryIterator<Key, Value> {
        var result: DictionaryIterator<Key, Value>!
        dispatchQueue.sync {
            result = dictionary.makeIterator()
        }
        return result
    }

    public func removeValue(forKey key: Key) {
        dispatchQueue.async(flags: .barrier) {
            self.dictionary.removeValue(forKey: key)
        }
    }

    public func removeAll() {
        dispatchQueue.async(flags: .barrier) {
            self.dictionary.removeAll()
        }
    }

    // MARK: - Constructors

    public init(dictionaryLiteral elements: (Key, Value)...) {
        elements.forEach({ dictionary[$0.0] = $0.1 })
    }

    // MARK: - Life cycle

    deinit {
        removeAll()
    }
}
