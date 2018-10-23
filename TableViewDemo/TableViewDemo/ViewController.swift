//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Rohan Taneja on 23.10.18.
//  Copyright © 2018 Rohan Taneja. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var articles = [
        Article(name: "Adidas Shoes", price: 10000),
        Article(name: "Nike Bag", price: 15000),
        Article(name: "Zalando Tshirt", price: 8000),
        Article(name: "Adidas Bag", price: 12000),
        Article(name: "Nike Football", price: 7000)
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)
        let article = articles[indexPath.row]
        cell.textLabel?.text = article.name
        cell.detailTextLabel?.text = priceFormatter.string(for: Double(article.price))
        return cell
    }
    
    @IBAction func addNewItemToList(){
        articles.append(Article(name: "New Item", price: 200))
        let lastRow = tableView.numberOfRows(inSection: 0)
        let indexPath = IndexPath(row: lastRow, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    lazy var priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.multiplier = 0.01
        return formatter
    }()
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            articles.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

struct Article {
    let name: String
    let price: Int
}

