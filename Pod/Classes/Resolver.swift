//
//  Resolver.swift
//  Pods
//
//  Created by Khoa Pham on 12/17/15.
//  Copyright © 2015 Fantageek. All rights reserved.
//

import Foundation

public class Resolver {
    var container = Container()

    public init(@noescape configure: Resolver -> Void = { _ in }) {
        configure(self)
    }
}

public extension Resolver {
    func registerSingleton<T>(singleton: T) {
        register {
            singleton
        }
    }

    func register<T>(tag tag: String? = nil, factory: () -> T) {
        container.register(tag: tag, factory: factory)
    }

    func resolve<T>(tag tag: String? = nil) throws -> T {
        return try container.resolve(tag: tag, builder: { (f: () -> T) in
            f()
        })
    }
}

public extension Resolver {
    func register<T, Arg1>(tag tag: String? = nil, factory: (Arg1) -> T) {
        container.register(tag: tag, factory: factory)
    }

    func resolve<T, Agr1>(tag tag: String? = nil, arg1: Agr1) throws -> T {
        return try container.resolve(tag: tag, builder: { (f: (arg1: Agr1) -> T) in
            f(arg1: arg1)
        })
    }
}

public extension Resolver {
    func register<T, Arg1, Arg2>(tag tag: String? = nil, factory: (Arg1, Arg2) -> T) {
        container.register(tag: tag, factory: factory)
    }

    func resolve<T, Agr1, Arg2>(tag tag: String? = nil, arg1: Agr1, arg2: Arg2) throws -> T {
        return try container.resolve(tag: tag, builder: { (f: (arg1: Agr1, arg2: Arg2) -> T) in
            f(arg1: arg1, arg2: arg2)
        })
    }
}
