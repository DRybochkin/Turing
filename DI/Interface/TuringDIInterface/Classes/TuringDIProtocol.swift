//
//  TuringDIProtocol.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 09.04.2019.
//  Copyright © 2019 Turing. All rights reserved.
//

import Foundation

public protocol TuringDIProtocol: class {

    // MARK: - Types

    typealias FabricWithContainer<T> = (TuringDIProtocol) -> T?
    typealias Fabric<T> = () -> T?

    // MARK: - Properties

    static var `default`: TuringDIProtocol { get set }

    // MARK: - Functions

    func register<T>(_ protocolType: T.Type, factory: @escaping FabricWithContainer<T>, scope: TuringDIScopeProtocol)
    func register<T>(_ protocolType: T.Type, factory: @escaping FabricWithContainer<T>)
    func register<T>(_ protocolType: T.Type, factory: @escaping Fabric<T>, scope: TuringDIScopeProtocol)
    func register<T>(_ protocolType: T.Type, factory: @escaping Fabric<T>)

    /**
        Возвращает unwrap optional экземпляр объекта удовлетворяющий протоколу T
        при инициализации объекта зарегистрированного как опциональный, например,
            diContainer.register(ServiceProtocol.self, factory: { return ServiceObject() }, scope: .optional)
        необходимо указывать это явным образом, например,
            let service: ServiceProtocol? = diContainer.resolve()
        в противном случае могут быть креши

        при инициализации объекта зарегистрированного как новый или одиночка, например,
            diContainer.register(ServiceProtocol.self, factory: { return ServiceObject() }, scope: .new)
            diContainer.register(ServiceProtocol.self, factory: { return ServiceObject() }, scope: .singleton)
        можно использовать как опциональный, так и нет, например,
            let service: ServiceProtocol = diContainer.resolve()
            let service: ServiceProtocol? = diContainer.resolve()
        в обоих случаях ошибки не будет

        при попытке инициализации объекта незарегистрированного протокола в дебаге будет вызываться fatalError()
        в релизе приложение будет крешиться, если использовать не опциональную переменную
        ошибка
            let service: ServiceProtocol = diContainer.resolve()
        ошибки не будет
            let service: ServiceProtocol? = diContainer.resolve()
     */
    func resolve<T>(_ protocolType: T.Type) -> T!
    func resolve<T>() -> T!

    func unregister(_ protocolType: Any.Type)
    func unregisterAll()
}
