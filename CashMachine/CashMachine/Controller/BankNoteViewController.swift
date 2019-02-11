//
//  BankNoteViewController.swift
//  CashMachine
//
//  Created by Gustavo Quenca on 10/02/19.
//  Copyright © 2019 Quenca. All rights reserved.
//

import UIKit

class BankNoteViewController: UIViewController {
    
    @IBOutlet weak var note10Label: UILabel!
    @IBOutlet weak var note20Label: UILabel!
    @IBOutlet weak var note50Label: UILabel!
    @IBOutlet weak var note100Label: UILabel!
    
    var notes: Cash!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        note10Label.text = String(notes.tenNote ?? 0)
        note20Label.text = String(notes.twentyNote ?? 0)
        note50Label.text = String(notes.fifityNote ?? 0)
        note100Label.text = String(notes.hundredNote ?? 0)
        
        notes.hundredNote = 0
        notes.tenNote = 0
        notes.fifityNote = 0
        notes.twentyNote = 0
        
    }
    
}
