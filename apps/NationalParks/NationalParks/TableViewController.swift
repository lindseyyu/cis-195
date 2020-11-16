//
//  TableViewController.swift
//  NationalParks
//
//  Created by user181204 on 11/12/20.
//

import UIKit
import Kingfisher
import Firebase

class TableViewController: UITableViewController {
    
    var parks = [Park]()
    let endpoint: String = "https://developer.nps.gov/api/v1/parks?limit=30&api_key=ccQQAK9aqS2tZvi1EBK99J4lN7FYXDSfF9Xjl0BV"
    var ref: DocumentReference!
    var data: [String: Any]?
    
    let db = Firestore.firestore()
    
    func configureRefreshControl() {
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action:
            #selector(handleRefreshControl), for: .valueChanged)
            
    }
    
    @objc func handleRefreshControl() {
        print ("calling APi now \n")
        makeAPIRequest()
        print("refreshed\n")
        DispatchQueue.main.async {
            self.refreshControl?.endRefreshing()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        configureRefreshControl()
    }
    
    
    @objc private func makeAPIRequest() {
        print("making request\n")
        let url = URL(string: endpoint)!
        let req = URLRequest(url: url)
        print (req)
        
        let task = URLSession.shared.dataTask(with: req) {(data, response, error) in
            guard let data = data, error == nil else {
                print("API request error.")
                return
            }
        if let response = try? JSONDecoder().decode(APIResponse.self, from: data) {
                DispatchQueue.main.async {
                    self.parks = response.data
                    self.updateDatabase()
                    self.tableView.reloadData()
                }
            }
        }
        task.resume()
    }
    
    func updateDatabase() {
        for i in 0..<parks.count {
            let park = parks[i]
            var image : String;
            if park.images.count > 0 {
                image = park.images[0].url
            } else {
                image = ""
            }
            let save: [String: Any] = ["name": park.name, "designation": park.designation, "image": image, "description": park.description]
            ref = db.collection("parks").document("\(i)")
            ref.setData(save, completion: {
                error in
                if let _ = error {
                    print ("Error")
                } else {
                    print ("no error")
                }
            })
        }
    }
    
    
  
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 30
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        db.collection("parks").document("\(indexPath.row)").getDocument{ (docSnapshot, error) in
            if let data = docSnapshot?.data() {
                if let title = cell.viewWithTag(3) as? UILabel {
                    title.text = data["name"] as? String
                }
                if let type = cell.viewWithTag(4) as? UILabel {
                    type.text = data["designation"] as? String
                }
                if let image = cell.viewWithTag(2) as? UIImageView {
                    if data["image"] as? String != "" {
                        let url = URL(string: (data["image"] as? String)!)
                        image.kf.setImage(with:url)
                    } else {
                        image.image = nil
                    }
                }
            }
        }
        return cell
    }
        
    var park: Park? = nil
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath ) {
            tableView.deselectRow(at: indexPath, animated: false)
            db.collection("parks").document("\(indexPath.row)").getDocument{ (docSnapshot, error) in
                if let data = docSnapshot?.data() {
                    self.data = data
                }
                self.performSegue(withIdentifier: "toDetail", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toDetail" {
                let cont = segue.destination as! ViewController
                cont.data = self.data
            }
        }
}
