//
//  ViewController.swift
//  tutorial1_lyu
//
//  Created by user181204 on 9/18/20.
//  Copyright © 2020 user181204. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad()")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear()")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear()")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear()")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
           super.viewDidDisappear(animated)
           print("viewDidDisappear()")
       }

}

