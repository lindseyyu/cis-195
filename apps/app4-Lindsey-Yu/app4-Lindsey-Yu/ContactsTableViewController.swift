//
//  ContactsTableViewController.swift
//  app4-Lindsey-Yu
//
//  Created by user181204 on 10/26/20.
//

import UIKit

class ContactsTableViewController: UITableViewController, AddContactDelegate {
    
    func didCreate(_contact: Contact) {
        dismiss(animated: true, completion: nil)
        arr.append(_contact)
        arr.sort {$0.lastName.lowercased() < $1.lastName.lowercased()}
        self.tableView.reloadData()
    }
  
    @IBAction func segueACV(_ sender: Any) {
        performSegue(withIdentifier: "toACVC", sender: nil)
    }
    // MARK: - Table view data source
    var arr: [Contact] = [Contact(firstName: "Lindsey", lastName: "Yu", company: "N/A", email: "lindsyu@wharton.upenn.edu", number: "9732704828", profile: nil), Contact(firstName: "Shoyo", lastName: "Hinata", company: "Karasuno", email: "tobefly@gmail.com", number: "10", profile: nil)]
    var dvc_contact: Contact? = nil

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "base", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row].firstName + " " + arr[indexPath.row].lastName
        cell.detailTextLabel?.text = arr[indexPath.row].company
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        self.dvc_contact = arr[indexPath.row]
        performSegue(withIdentifier: "toDVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDVC" {
            let dvc = segue.destination as! DetailViewController
            dvc.contact = self.dvc_contact
        } else if segue.identifier == "toACVC" {
            let nav_acvc = segue.destination as! UINavigationController
            let acvc = nav_acvc.topViewController as! AddContactViewController
            acvc.delegate = self        }
    }
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
