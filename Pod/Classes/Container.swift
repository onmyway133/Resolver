//
//  Container.swift
//  Pods
//
//  Created by Khoa Pham on 12/18/15.
//
//

import Foundation

struct Container {
    var registrations = [RegistrationKey: RegistrationType]()

    mutating func register<F>(tag tag: String? = nil, factory: F) {
        let key = RegistrationKey(tag: tag ?? "", factoryType: F.self)
        let registration = Registration<F>(factory: factory)

        registrations[key] = registration
    }

    func resolve<T, F>(tag tag: String? = nil, builder: F -> T) throws -> T {
        let key = RegistrationKey(tag: tag ?? "", factoryType: F.self)

        if let registration = registrations[key] as? Registration<F> {
            return builder(registration.factory)
        } else {
            throw ResolverError.RegistrationNotFound
        }
    }
}
