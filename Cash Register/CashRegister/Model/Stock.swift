//
//  Stock.swift
//  CashRegister
//
//  Created by user232105 on 2/21/23.
//

import Foundation

struct Product : Hashable {
    var name : String
    var price : Int
    
}

let shoes = Product(name: "Shoes", price: 90)
let pants = Product(name: "Pants", price: 50)
let hats = Product(name: "Hats", price: 20)
let dress = Product(name: "Dress", price: 90)
let tshirts = Product(name: "Tshirts", price: 50)
let socks = Product(name: "Socks", price: 20)
let products = [shoes, pants, hats, dress, tshirts, socks]

var stocks = [Product : Int] ()


struct Transaction {
    var date : Date
    var product : Product
    var quantity : Int
}

var transactions = [Transaction] ()





