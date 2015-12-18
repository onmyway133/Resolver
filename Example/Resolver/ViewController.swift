//
//  ViewController.swift
//  Resolver
//
//  Created by Khoa Pham on 12/17/2015.
//  Copyright (c) 2015 Khoa Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let a = { r in
            r + 1
        }

        let b = a(20)
        let c = a.dynamicType
        print(c)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

