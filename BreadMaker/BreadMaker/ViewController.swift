//
//  ViewController.swift
//  BreadMaker
//
//  Created by Sukru on 1.01.2021.
//

import UIKit

class ViewController: UIViewController {
    var bread = 0
    var inventory = 0
    var funds = 0.0
    var sales = 0
    var zaman : Timer?
    var price = 1.0
    var flour = 1000
    var flourcost = 15
    @IBOutlet weak var flourbuttonoutlet: UIButton!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var kg: UILabel!
    @IBOutlet weak var breadsecond: UILabel!
    @IBOutlet weak var breadPrice: UILabel!
    @IBOutlet weak var inventoryLabel: UILabel!
    @IBOutlet weak var fundsLabel: UILabel!
    @IBOutlet weak var breadLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        breadLabel.text = "Bread: \(bread)"
        inventoryLabel.text = "Inventory: \(inventory)"
        mytimer()
        fundsLabel.text = "Available Funds: \(funds)"
        breadPrice.text = "Price per Bread: \(price)"
        
        
    }
    func mytimer () {
        zaman = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(starttimer), userInfo: nil, repeats: true)
    }
    
    @objc func starttimer() {
        if Int(funds) < flourcost {
            flourbuttonoutlet.isEnabled = false
        }
        else {
            flourbuttonoutlet.isEnabled = true
            
        }
        
        if inventory > 0
        {
            sales+=1
            
            funds = Double(sales * (Int(Double(price))))
            print("FUNDS SALES: \(funds)")
            fundsLabel.text = "Available Funds:$ \(Int(funds))"
            
            inventory-=1
            inventoryLabel.text = "Inventory: \(inventory)"
        }
        
    }
    @IBAction func breadButton(_ sender: Any) {
        bread+=1
        flour-=1
        kg.text = "\(flour) Kg"
        breadLabel.text = "Bread: \(bread)"
        inventory+=1
        inventoryLabel.text = "Inventory: \(inventory)"
        
    }
    @IBAction func lowerButton(_ sender: Any) {
        price-=0.2
        breadPrice.text = "Price per Bread:$ \(price)"
        
    }
    @IBAction func raiseButton(_ sender: Any) {
    }
    @IBAction func flourButton(_ sender: Any) {
        flour+=1000
        
        zaman?.invalidate()
        funds = funds - Double(flourcost)
        print("FUNDSSSSSSS: \(funds)")
        fundsLabel.text = "Available Funds:$ \(funds)"
        kg.text = "\(flour) Kg"
        //zaman?.invalidate()
        mytimer()
        
    }
   
    

}

