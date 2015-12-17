//
//  Resolver.swift
//  Pods
//
//  Created by Khoa Pham on 12/17/15.
//  Copyright © 2015 Fantageek. All rights reserved.
//

import Foundation

public protocol Resolver {
    func resolve<T: AnyObject>() -> T
}
