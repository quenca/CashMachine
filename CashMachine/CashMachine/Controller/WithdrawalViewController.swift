//
//  ViewController.swift
//  CashMachine
//
//  Created by Gustavo Quenca on 09/02/19.
//  Copyright © 2019 Quenca. All rights reserved.
//

import UIKit

class WithdrawalViewController: UIViewController {
    
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button30: UIButton!
    @IBOutlet weak var button50: UIButton!
    @IBOutlet weak var button100: UIButton!
    @IBOutlet weak var button150: UIButton!
    @IBOutlet weak var buttonOther: UIButton!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var amountValue: UITextField!
    
    var cash = Cash()
    
    var cashOut: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button10.tag = 10
        button10.addTarget(self,action:#selector(buttonClicked),
                           for:.touchUpInside)
        
        button30.tag = 30
        button30.addTarget(self,action:#selector(buttonClicked),
                           for:.touchUpInside)
        button50.tag = 50
        button50.addTarget(self,action:#selector(buttonClicked),
                           for:.touchUpInside)
        button100.tag = 100
        button100.addTarget(self,action:#selector(buttonClicked),
                            for:.touchUpInside)
        button150.tag = 150
        button150.addTarget(self,action:#selector(buttonClicked),
                            for:.touchUpInside)
        buttonOther.tag = 0
        buttonOther.addTarget(self,action:#selector(buttonClicked),
                              for:.touchUpInside)
        enterButton.tag = 101
        enterButton.addTarget(self,action:#selector(buttonClicked),
                              for:.touchUpInside)
        cancelButton.tag = 2
        cancelButton.addTarget(self,action:#selector(buttonClicked),
                               for:.touchUpInside)
    }
    
    @objc func buttonClicked(sender: UIButton) {
        
        print(sender.tag)
        switch sender.tag {
        case 10:
            cashOut = 10
            withdrawal()
        case 30:
            cashOut = 30
            withdrawal()
        case 50:
            cashOut = 50
            withdrawal()
        case 100:
            cashOut = 100
            withdrawal()
        case 150:
            cashOut = 150
            withdrawal()
        case 101:
            if let amount = Int(amountValue.text!) {
                if amount % 10 == 0 {
                    cashOut = Int(amount)
                    withdrawal()
                } else {
                    let alert = UIAlertController(title: "No cash available", message: "Please enter a number divisible by 10", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            } else {
                let alert = UIAlertController(title: "Please enter a valid number", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        case 2:
            enterButton.isHidden = true
            cancelButton.isHidden = true
            amountLabel.isHidden = true
            amountValue.isHidden = true
        default:
            enterButton.isHidden = false
            cancelButton.isHidden = false
            amountLabel.isHidden = false
            amountValue.isHidden = false
            amountValue.text = ""
        }
    }
    
    func withdrawal () {
        while cashOut > 0 {
            if cashOut >= 100 {
                cash.hundredNote = cashOut / 100
                cashOut = cashOut - 100 *  cash.hundredNote!
            }
            if cashOut >= 50 {
                cash.fifityNote = cashOut / 50
                cashOut = cashOut -  50 * cash.fifityNote!
            }
            if cashOut >= 20 {
                cash.twentyNote = cashOut / 20
                cashOut = cashOut - 20 * cash.twentyNote!
            }
            if cashOut >= 10 {
                cash.tenNote = cashOut / 10
                cashOut = cashOut - 10 * cash.tenNote!
            }
        }
        
        performSegue(withIdentifier: "showCash", sender: (Any).self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCash" {
            let controller =  segue.destination as! BankNoteViewController
            controller.notes = cash
        }
    }
}

