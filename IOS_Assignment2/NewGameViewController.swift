//
//  NewGameViewController.swift
//  IOS_Assignment2
//
//  Created by Mark Anthony Natividad on 16/5/20.
//  Copyright © 2020 Mark Anthony Natividad. All rights reserved.
//

import UIKit

class NewGameViewController: UIViewController {
    
    var countdownSeconds:Int = 4;
    var countDowntimer = Timer();
    var gameTimer = Timer();
    var bubble = Bubble();
    var gameLength:Int = UserDefaults.standard.integer(forKey: "gameLength")
    var bubbles:Int = UserDefaults.standard.integer(forKey: "bubbles")
    var screenWidth:UInt32{
        return UInt32(UIScreen.main.bounds.width)
    }
    var screenHeight:UInt32{
        return UInt32(UIScreen.main.bounds.height)
    }
    
    @IBOutlet weak var countDownLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    countDownLabel.text = "READY!";
        countDowntimer = Timer.scheduledTimer( timeInterval: 1, target: self, selector: #selector(NewGameViewController.countdown), userInfo: nil, repeats: true)
        gameTimer = Timer.scheduledTimer( timeInterval: 1, target: self, selector: #selector(NewGameViewController.gameTimeTimer), userInfo: nil, repeats: true)
        timeLabel.text = String(gameLength)
        
    }
    
    @objc func countdown() {
        countDownLabel.text = "READY!";    countdownSeconds -= 1
        countDownLabel.text = String(countdownSeconds)
        if (countdownSeconds == 0){
            countDowntimer.invalidate()
            countDownLabel.text = "START!"
            
            
        }
    }
    
    @objc func gameTimeTimer(){
        
        timeLabel.text = String(gameLength)
        repeat{
        generateBubble()
            bubbles -= 1
        }while bubbles > 0
        
        gameLength -= 1
        timeLabel.text = String(gameLength)      //  self.view.remove
        
        self.viewWillAppear(true)
        if (gameLength == 0){
            gameTimer.invalidate()
            countDownLabel.text = "Game Over!"
        }
        
    }
    func generateBubble(){
        
        bubble = Bubble()
        bubble.frame = CGRect(x: CGFloat(10 + arc4random_uniform(screenWidth - 100)), y: CGFloat(160 + arc4random_uniform(screenHeight - 150)), width: CGFloat(60), height: CGFloat(60))
        
        bubble.layer.cornerRadius = bubble.frame.height/2
        
        bubble.pulsate()
        self.view.addSubview(bubble)
        
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
