//
//  ResolverTests.swift
//  Resolver
//
//  Created by Khoa Pham on 12/18/15.
//  Copyright © 2015 Fantageek. All rights reserved.
//

import XCTest

protocol AnimalType {
    var name: String? { get }
}

class Cat: AnimalType {
    let name: String?

    init(name: String?) {
        self.name = name
    }
}

protocol PersonType {
    func play()
}

class PetOwner: PersonType {
    let pet: AnimalType

    init(pet: AnimalType) {
        self.pet = pet
    }

    func play() {
        let name = pet.name ?? "someone"
        print("I'm playing with \(name).")
    }
}

class ResolverTests: XCTestCase {
    func testResolving() {
        
    }
}
