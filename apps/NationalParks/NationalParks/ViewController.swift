//
//  ViewController.swift
//  NationalParks
//
//  Created by user181204 on 11/12/20.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    var park: Park?
    var data: [String: Any]?
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var designation: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = data as [String : Any]? {
            name.text = data["name"] as? String
            desc.text = data["description"] as? String
            designation.text = data["designation"] as? String
            if data["image"] as? String != "" {
                let url = URL(string: (data["image"] as? String)!)
                image.kf.setImage(with: url)
            }
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
