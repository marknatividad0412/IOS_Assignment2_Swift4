//
//  ViewController.swift
//  IOS_Assignment2
//
//  Created by Mark Anthony Natividad on 15/5/20.
//  Copyright © 2020 Mark Anthony Natividad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var playerNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerNameLabel.text = UserDefaults.standard.object(forKey: "playerName") as? String
        // Do any additional setup after loading the view.
        
    }


}

