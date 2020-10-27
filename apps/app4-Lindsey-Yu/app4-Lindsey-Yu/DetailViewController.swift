//
//  DetailViewController.swift
//  app4-Lindsey-Yu
//
//  Created by user181204 on 10/26/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    var contact: Contact? = nil
    
    
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    
    
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var number: UILabel!
    
    

    
    override func viewDidLoad() {
     
        if let new_contact = contact as Contact? {
            profile.image = new_contact.profile
            name.text = new_contact.firstName + " " + new_contact.lastName
            company.text = new_contact.company
            email.text = new_contact.email
            number.text = new_contact.number
        }

        // Do any additional setup after loading the view.
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
