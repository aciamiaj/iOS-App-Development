//
//  HistoryViewController.swift
//  CashRegister
//
//  Created by user232105 on 2/22/23.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var historyTableView: UITableView!
    var transaction : Transaction?
         
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath)
        let t = transactions[indexPath.row]
        cell.textLabel?.text = "\(t.product.name)"
        cell.detailTextLabel?.text = "\(t.quantity)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        transaction = transactions[indexPath.row]
        performSegue(withIdentifier: "historyItemSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "historyItemSegue",
           let destination = segue.destination as? HistoryItemViewController {
           destination.transaction = transaction
        }
        
        let backItem = UIBarButtonItem()
            backItem.title = "History Items"
            navigationItem.backBarButtonItem = backItem    }


}
