import UIKit

class NewsfeedTableViewController: UITableViewController {
    
    var newsItems = [NewsItem]()
    
    // MARK: IBAction
    @IBAction func didSelectAdd(_ sender: UIBarButtonItem) {
        
        print ("add button clicked")
        
        let alert = UIAlertController(title: "Enter text", message: nil, preferredStyle: .alert)
        alert.addTextField()
        
        let submit = UIAlertAction(title: "Submit", style: .default) {
            [unowned alert] _ in
            let answer = alert.textFields![0].text!
            print(answer)
            self.newsItems.append(NewsItem(favorite: false, title: answer ))
            self.tableView.reloadData()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default) {_ in}
        
        alert.addAction(submit)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }

    // MARK: - Basic table view methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        // TODO: How many sections? (Hint: we have 1 section and x rows)
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: How many rows in our section?
        return newsItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: Deque a cell from the table view and configure its UI. Set the label and star image by using cell.viewWithTag(..)
        let deque_cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let label = deque_cell.viewWithTag(1) as? UILabel {
            label.text = newsItems[indexPath.row].title
        }
        if let imageView = deque_cell.viewWithTag(2) as? UIImageView {
            if self.newsItems[indexPath.row].favorite {
                imageView.image = UIImage(named: "star-filled")
            } else {
                imageView.image = UIImage(named: "star-hollow")
            }
        }
        return deque_cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
    // MARK: - Handle user interaction
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        newsItems[indexPath.row].favorite.toggle()
        print(newsItems[indexPath.row].favorite)
        tableView.reloadData()
        tableView.reloadInputViews()
        
    }
    
    
    // MARK: - Swipe to delete functionality
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            newsItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }

}

