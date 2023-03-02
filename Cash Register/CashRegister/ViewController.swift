//
//  ViewController.swift
//  CashRegister
//
//  Created by user232105 on 2/22/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var productTable: UITableView!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    var priceForProduct = 0
    var price = 0
    var quantity = 0
    var quantityString = "0"
    var productSelected : Product?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stocks[shoes] = 45
        stocks[pants] = 10
        stocks[hats] = 10
        stocks[tshirts] = 10
        stocks[dress] = 24
        stocks[socks] = 50
        //if there is no product selected we cannot click on buy
        buyButton.isEnabled = false
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        productTable.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTable.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
        let price = products[indexPath.row].price
        let stock = stocks[products[indexPath.row]] ?? 0
        let text = "\(products[indexPath.row].name)  \t\t\t\t\t\t\t\t\(stock)"
        cell.textLabel?.text = text
        cell.detailTextLabel?.text = "$\(price)"
        cell.textLabel?.textAlignment = .left
        cell.detailTextLabel?.textAlignment = .right
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        typeLabel.text = products[indexPath.row].name
        priceForProduct = products[indexPath.row].price
        price = quantity * priceForProduct
        totalLabel.text = "\(price)"
        buyButton.isEnabled = true
        productSelected = products[indexPath.row]
        
    }
        
    @IBAction func numberClick(_ sender: UIButton) {
        print(sender.tag)
        if sender.tag >= 0 || sender.tag < 10 {
            quantityString = "\(quantityString)\(sender.tag)"
            quantity = Int(quantityString) ?? 0
            quantityLabel.text = "\(quantity)"
            price = quantity * priceForProduct
            totalLabel.text = "\(price)"
        }
    }
    
    @IBAction func buyClick(_ sender: Any) {
        let transaction = Transaction(date : Date(), product : productSelected!, quantity : quantity )
        
        transactions.append(transaction)
        print(transactions)
        let inStock = stocks[productSelected!] ?? 0
        stocks[productSelected!] = inStock - quantity
        productTable.reloadData()
        
        //reset
        buyButton.isEnabled = false
        productSelected = nil
        totalLabel.text = "0"
        typeLabel.text = ""
        quantityLabel.text = ""
        quantity = 0
        quantityString = ""
  
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Cash Register App"
        navigationItem.backBarButtonItem = backItem
    }
    
}

