# Resolver

❤️ Support my app ❤️ 

- [Push Hero - pure Swift native macOS application to test push notifications](https://www.producthunt.com/posts/push-hero-2)
- [PastePal - Pasteboard, note and shortcut manager](https://www.producthunt.com/posts/pastepal)
- [Frame recorder - Recorder gif and video with frame](https://www.producthunt.com/posts/frame-recorder)
- [Alias - App and file shortcut manager](https://www.producthunt.com/posts/alias-shortcut-manager)
- [Other apps](https://onmyway133.github.io/projects/)

❤️❤️😇😍🤘❤️❤️

A simple resolver for Swift

[![CI Status](http://img.shields.io/travis/Khoa Pham/Resolver.svg?style=flat)](https://travis-ci.org/Khoa Pham/Resolver)
[![Version](https://img.shields.io/cocoapods/v/Resolver.svg?style=flat)](http://cocoapods.org/pods/Resolver)
[![License](https://img.shields.io/cocoapods/l/Resolver.svg?style=flat)](http://cocoapods.org/pods/Resolver)
[![Platform](https://img.shields.io/cocoapods/p/Resolver.svg?style=flat)](http://cocoapods.org/pods/Resolver)


## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Features
Taking example from [Swinject](https://github.com/Swinject/Swinject)

Supposed we have classes and protocols like this

```swift
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
```

### Simple factory

```swift
let resolver = Resolver()
resolver.register {
    Cat(name: "tom") as AnimalType
}

let cat = try! resolver.resolve() as AnimalType
XCTAssert(cat.name == "tom")
```

### Tag

```swift
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
```

### Argument

```swift
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
```

### Singleton

```swift
let cat = Cat(name: "tom") as AnimalType

let resolver = Resolver()
resolver.registerSingleton(cat)

let someCat = try! resolver.resolve() as AnimalType
XCTAssert(someCat as! Cat === cat as! Cat)
```

## Installation

Resolver is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Resolver"
```

## Author

Khoa Pham, onmyway133@gmail.com

## License

Resolver is available under the MIT license. See the LICENSE file for more info.
