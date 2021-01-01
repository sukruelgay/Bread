//
//  ViewController.swift
//  BreadMaker
//
//  Created by Sukru on 1.01.2021.
//

import UIKit

class ViewController: UIViewController {
    var bread = 0
    var arttir = 0
    var inventory = 0
    var funds = 0.0
    var sales = 0
    var zaman : Timer?
    var zaman2: Timer?
    var price = 1.0
    var flour = 500
    var flourcost = 35.0
    var timeint = 1.0
    var autobread = 25.0
    @IBOutlet weak var flourbuttonoutlet: UIButton!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var otobreadoutlet: UIButton!
    @IBOutlet weak var kg: UILabel!
    @IBOutlet weak var breadsecond: UILabel!
    @IBOutlet weak var breadPrice: UILabel!
    @IBOutlet weak var inventoryLabel: UILabel!
    @IBOutlet weak var fundsLabel: UILabel!
    @IBOutlet weak var breadLabel: UILabel!
    @IBOutlet weak var otobreadprice: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        breadLabel.text = "Bread: \(bread)"
        inventoryLabel.text = "Inventory: \(inventory)"
        zaman = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(starttimer), userInfo: nil, repeats: true)
        zaman2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(zamanbaslat), userInfo: nil, repeats: true)
        fundsLabel.text = "Available Funds: \(funds)"
        breadPrice.text = "Price per Bread: \(price)"
        costLabel.text = "$ \(Int(flourcost))"
        
        
    }

    
    @objc func starttimer() {
        
        if Int(funds) < Int(flourcost) {
            flourbuttonoutlet.isEnabled = false
        }
        else {
            flourbuttonoutlet.isEnabled = true
            
        }
        
        if Int(funds) < Int(autobread) {
            otobreadoutlet.isEnabled = false
            
        }
        else {
            otobreadoutlet.isEnabled = true
        }
        
        if inventory > 0
        {
        
            funds = (funds + price)
            
            //print("FUNDS SALES: \(funds)")
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
        price-=0.1
        timeint-=0.3
        print(timeint)
        zaman?.invalidate()
        zaman = Timer.scheduledTimer(timeInterval: timeint, target: self, selector: #selector(starttimer), userInfo: nil, repeats: true)
        breadPrice.text = "Price per Bread:$ \(price)"
        
    }
    @IBAction func raiseButton(_ sender: Any) {
        price+=0.1
        timeint+=0.3
        print(timeint)
        zaman?.invalidate()
        zaman = Timer.scheduledTimer(timeInterval: timeint, target: self, selector: #selector(starttimer), userInfo: nil, repeats: true)
        breadPrice.text = "Price per Bread:$ \(price)"
        
        
    }
    @IBAction func flourButton(_ sender: Any) {
        flour+=500
        funds = funds - Double(flourcost)
        fundsLabel.text = "Available Funds:$ \(Int(funds))"
        kg.text = "\(flour) Kg"
        //zaman?.invalidate()
        
        
    }
    @IBAction func otobread(_ sender: Any) {
        funds = funds - autobread
        autobread+=5
        otobreadprice.text = "\(autobread)"
        arttir+=3
        
    }
    
    @objc func zamanbaslat(){
        print("zaman2 basladi")
        if arttir > 0 {
            bread = bread + arttir
            inventory = inventory + arttir
            inventoryLabel.text = "Inventory: \(inventory)"
            breadLabel.text = "Bread: \(bread)"
    }

}
}
