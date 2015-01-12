//
//  ViewController.swift
//  TipCalculator-2
//
//  Created by Ashar Rizqi on 1/11/15.
//  Copyright (c) 2015 Ashar Rizqi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billTotalLabel: UILabel!
    @IBOutlet weak var tipSegment: UISegmentedControl!
    @IBOutlet weak var currencyLabel: UILabel!
    
    var tipPercentages = [0.15, 0.18, 0.20]
    var currencyMultiplier = 1.0
    var currency = "usd"
    var defaults = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = "$0.00"
        billTotalLabel.text = "$0.00"
        defaults.setObject(currency, forKey: "currency")
        defaults.synchronize()
        currencyLabel.text = currency
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //var defaults = NSUserDefaults.standardUserDefaults()
        var cur = defaults.objectForKey("currency") as String
        if ( cur == "cad") {
            currencyMultiplier = 1.18
        }
        else if (cur == "usd"){
            currencyMultiplier = 1.0
        }
        reloadLabels()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func editChanged(sender: AnyObject) {
        var bill = (billTextField.text as NSString).doubleValue
        var tipPercent = tipPercentages[tipSegment.selectedSegmentIndex]
        var tip = (bill * tipPercent) * currencyMultiplier
        var total = (bill + tip) * currencyMultiplier
        tipLabel.text = String(format: "$%.2f", tip)
        billTotalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
        
    }
    
    func reloadLabels(){
        var bill = (billTextField.text as NSString).doubleValue
        var tipPercent = tipPercentages[tipSegment.selectedSegmentIndex]
        var tip = (bill * tipPercent) * currencyMultiplier
        var total = (bill + tip) * currencyMultiplier
        tipLabel.text = String(format: "$%.2f", tip)
        billTotalLabel.text = String(format: "$%.2f", total)
        currencyLabel.text = defaults.objectForKey("currency") as String
    }
    

}

