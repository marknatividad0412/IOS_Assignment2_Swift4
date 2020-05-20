//
//  ViewController.swift
//  IOS_Assignment2
//
//  Created by Mark Anthony Natividad on 15/5/20.
//  Copyright © 2020 Mark Anthony Natividad. All rights reserved.
//

import UIKit
import Foundation



class ViewController: UIViewController {

    
    @IBOutlet weak var playerNameLabel: UILabel!
    
    @IBAction func resetAllButton(_ sender: Any) {
        
        
        
        
       
              
    }
    
    @IBAction func exitButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "WARNING!", message: "Are you sure you want to exit the game?", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
           
            exit(0);
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         playerNameLabel.text = UserDefaults.standard.object(forKey: "playerName") as? String
        
    }


}

