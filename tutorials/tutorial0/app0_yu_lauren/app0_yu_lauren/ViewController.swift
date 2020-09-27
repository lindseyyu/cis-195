//
//  ViewController.swift
//  app0_yu_lauren
//
//  Created by user181204 on 9/26/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorText: UILabel!
    var state = "red"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func action(_ sender: AnyObject) {
        if (state == "red") {
            colorText.text = "Blue"
            colorText.textColor = UIColor.systemBlue
            state = "blue"
        } else {
            colorText.text = "Red"
            colorText.textColor = UIColor.systemRed
            state = "red"        }
    }


}

