//
//  ViewController.swift
//  CHCUIKit
//
//  Created by 陈鸿城 on 04/27/2021.
//  Copyright (c) 2021 陈鸿城. All rights reserved.
//

import UIKit
import CHCUIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(DeviceInfo.deviceCPUUsage()) 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

