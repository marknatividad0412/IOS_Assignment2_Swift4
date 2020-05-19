//
//  SettingsViewController.swift
//  IOS_Assignment2
//
//  Created by Mark Anthony Natividad on 16/5/20.
//  Copyright © 2020 Mark Anthony Natividad. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate{
    
    var gameLength:Int = 30;
    var bubbles:Int = 15;
         let settingsDefaults = UserDefaults.standard
    @IBOutlet weak var playerNameTextField: UITextField!
    
    @IBAction func gameLengthSlider(_ sender: UISlider) {
        
        gameLength = Int(sender.value)
        gameLengthLabel.text = String(gameLength)
    }
    @IBOutlet weak var gameLengthLabel: UILabel!
    
    @IBOutlet weak var bubblesLabel: UILabel!
    
    @IBAction func bubblesSlider(_ sender: UISlider) {
        
        bubbles = Int(sender.value)
        bubblesLabel.text = String(bubbles)
    }
    
    
    @IBAction func saveButton(_ sender: UIButton) {
       settingsDefaults.set(playerNameTextField.text, forKey: "playerName")
        settingsDefaults.set(gameLengthLabel.text, forKey: "gameLength")
        
        settingsDefaults.set(bubblesLabel.text, forKey: "bubbles")
        
        
    }
    
    
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        playerNameTextField.resignFirstResponder()
       return true
   }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
    
//self.playerNameTextField.delegate = self        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
