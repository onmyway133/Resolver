//
//  Container.swift
//  Pods
//
//  Created by Khoa Pham on 12/17/15.
//  Copyright © 2015 Fantageek. All rights reserved.
//

import Foundation

public class Container {

}

extension Container: Resolver {
    public func resolve<T : AnyObject>() -> T {
        fatalError()
    }
}
