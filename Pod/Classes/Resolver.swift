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

    init(@noescape configure: Resolver -> Void = { _ in }) {
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

    func resolve<T>(tag tag: String? = nil) -> T? {
        return container.resolve(tag: tag, builder: { (f: () -> T) in
            f()
        })
    }
}
