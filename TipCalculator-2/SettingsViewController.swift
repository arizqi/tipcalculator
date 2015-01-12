//
//  SettingsViewController.swift
//  TipCalculator-2
//
//  Created by Ashar Rizqi on 1/11/15.
//  Copyright (c) 2015 Ashar Rizqi. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var currencyTextField: UITextField!
    var defaults = NSUserDefaults.standardUserDefaults()
    var alert = UIAlertView()
    let currencies = ["usd", "cad"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyTextField.text = defaults.valueForKey("currency") as String
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        
        var currency = currencyTextField.text
        if contains(currencies, currency){
            defaults.setObject(currency, forKey: "currency")
            defaults.synchronize()
        }
        else {
            alert.title = "Uh Oh!"
            alert.message = "Enter usd or cad"
            alert.addButtonWithTitle("OK")
            alert.show()

        }
    }
    

}
