//
//  ResolverTests.swift
//  Resolver
//
//  Created by Khoa Pham on 12/18/15.
//  Copyright © 2015 Fantageek. All rights reserved.
//

import XCTest
import Resolver

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
    var pet: AnimalType { get }
    func play() -> String
}

class PetOwner: PersonType {
    let pet: AnimalType

    init(pet: AnimalType) {
        self.pet = pet
    }

    func play() -> String {
        let name = pet.name ?? "someone"
        return "I'm playing with \(name)."
    }
}

class ResolverTests: XCTestCase {
    func testSimple() {
        let resolver = Resolver()
        resolver.register {
            Cat(name: "tom") as AnimalType
        }

        let cat = try! resolver.resolve() as AnimalType
        XCTAssert(cat.name == "tom")
    }

    func testTag() {
        let resolver = Resolver()
        resolver.register(tag: "tom") {
            Cat(name: "tom") as AnimalType
        }

        resolver.register(tag: "meo") {
            Cat(name: "meo") as AnimalType
        }

        let tom = try! resolver.resolve(tag: "tom") as AnimalType
        let meo = try! resolver.resolve(tag: "meo") as AnimalType

        XCTAssert(tom.name == "tom")
        XCTAssert(meo.name == "meo")
    }

    func testArgument() {
        let resolver = Resolver()

        resolver.register {
            Cat(name: "tom") as AnimalType
        }

        resolver.register { cat in
            PetOwner(pet: cat) as PersonType
        }

        let cat = try! resolver.resolve() as AnimalType
        let owner = try! resolver.resolve(arg1: cat) as PersonType

        XCTAssert(owner.pet.name == "tom")
        XCTAssert(owner.play() == "I'm playing with tom.")
    }

    func testSingleton() {
        let cat = Cat(name: "tom") as AnimalType

        let resolver = Resolver()
        resolver.registerSingleton(cat)

        let someCat = try! resolver.resolve() as AnimalType
        XCTAssert(someCat as! Cat === cat as! Cat)
    }
}
