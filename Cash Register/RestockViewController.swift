//
//  RestockViewController.swift
//  CashRegister
//
//  Created by user232105 on 2/22/23.
//

import UIKit

class RestockViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var restockTableView: UITableView!
    
    @IBOutlet weak var addStockText: UITextField!
    
    @IBOutlet weak var restockButton: UIButton!
    
    var productSelected : Product?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = restockTableView.dequeueReusableCell(withIdentifier: "restockItemCell", for: indexPath)

        let stock = stocks[products[indexPath.row]] ?? 0
        let text = "\(products[indexPath.row].name)\t\t\t\t\t\t\t\t\t\t\(stock)"
        cell.textLabel?.text = text
        return cell
        
        
        }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        productSelected = products[indexPath.row]
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        productSelected = nil
        
    }
    
    @IBAction func restockClick(_ sender: Any) {
        if productSelected == nil {
            let alert = UIAlertController (title: "Error", message: "You have to select an item and provide a new quantity", preferredStyle: .alert)
            alert.addAction(UIAlertAction (title: "OK", style: .destructive))
            UIApplication.shared.keyWindow?.rootViewController?.present(alert , animated: true)
        } else if addStockText.text?.isEmpty ?? true {
            let alert = UIAlertController (title: "Error", message: "You have to select an item and provide a new quantity", preferredStyle: .alert)
            alert.addAction(UIAlertAction (title: "OK", style: .destructive))
            UIApplication.shared.keyWindow?.rootViewController?.present(alert , animated: true)
        } else if let unit = Int(addStockText.text ?? "0"), let product = productSelected {
            let actualStock = stocks[product] ?? 0
            stocks[product] = actualStock + unit
            restockTableView.reloadData()
        }
        
    }
    
    @IBAction func cancelClick(_ sender: Any) {
        addStockText.text = ""
        productSelected = nil
        
    }

}
