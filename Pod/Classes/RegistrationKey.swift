//
//  RegistrationKey.swift
//  Pods
//
//  Created by Khoa Pham on 12/18/15.
//
//

import Foundation

struct RegistrationKey {
    let tag: String
    let factoryType: Any.Type

    func key() -> String {
        return String(tag) + String(factoryType)
    }
}

extension RegistrationKey: Equatable, Hashable {
    var hashValue: Int {
        get {
            return key().hashValue
        }
    }
}

func ==(l: RegistrationKey, r: RegistrationKey) -> Bool {
    return l.tag == r.tag
        && l.factoryType == r.factoryType
}
