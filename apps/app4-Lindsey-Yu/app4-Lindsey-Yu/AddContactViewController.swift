//
//  AddContactViewController.swift
//  app4-Lindsey-Yu
//
//  Created by user181204 on 10/26/20.
//

import UIKit

protocol AddContactDelegate: class {
    func didCreate(_contact: Contact)
}

class AddContactViewController: UIViewController {
    
    weak var delegate : AddContactDelegate?

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var company: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var number: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func save(_ sender: Any) {
        let newContact = createNew()
        dump(newContact)
        if newContact != nil {
            self.delegate?.didCreate(_contact: newContact!)
        }
        
    }
    
    func createNew() ->  Contact? {
        if (firstName.hasText && lastName.hasText && company.hasText && email.hasText && number.hasText) {
            return Contact(firstName: firstName.text!, lastName: lastName.text!, company: company.text!, email: email.text!, number: number.text!, profile: nil)
        }
        return nil
    }

}
