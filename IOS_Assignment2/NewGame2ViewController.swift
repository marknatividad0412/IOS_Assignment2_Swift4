//
//  NewGame2ViewController.swift
//  IOS_Assignment2
//
//  Created by Mark Anthony Natividad on 17/5/20.
//  Copyright © 2020 Mark Anthony Natividad. All rights reserved.
//

import UIKit


class NewGame2ViewController: UIViewController {

    // declaring variables
    var gameTimer: Timer?
    var bubble = Bubble()
    var bubbleArray = [Bubble]()
    var currentScore:Double = 0;
    var highestScore:Double = 0;
    // Assigning user defaults values to variables
    var gameLength:Int = UserDefaults.standard.integer(forKey: "gameLength")
    var bubbles:Int = UserDefaults.standard.integer(forKey: "bubbles")
    var playerName = UserDefaults.standard.object(forKey: "playerName") as? String
    // variable for combo points
    var lastBubbleValue:Double = 0
    // for high scores
    var rankingDictionary = [String : Double]()
    var previousRankingDictionary: Dictionary? = [String : Double]()
    var sortedHighScoreArray = [(key: String, value: Double)]()
    // for getting screen size
    var screenWidth: UInt32{
        return UInt32(UIScreen.main.bounds.width)
    }
    var screenHeight: UInt32{
        return UInt32(UIScreen.main.bounds.height)
    }
    
    // connected views
    
    @IBOutlet weak var gameTimeLabel: UILabel!
    
    @IBOutlet weak var currenScoreLabel: UILabel!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currenScoreLabel.text = "0";
        // for comparing current score with highest score
       previousRankingDictionary = UserDefaults.standard.dictionary(forKey: "ranking") as? Dictionary<String,Double>
        if previousRankingDictionary != nil{
            rankingDictionary = previousRankingDictionary!
            sortedHighScoreArray = rankingDictionary.sorted(by: {$0.value > $1.value})
        }
        
        //for game timer
        
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            timer in
            self.setRemainingTime()
            self.removeBubble()
            self.createBubble()
        }
        
            // Do any additional setup after loading the view.
    }
    
    // setRemainingTime function
    
    @objc func setRemainingTime(){
        
        // for updating game time label
        gameTimeLabel.text = "\(gameLength)"
        
        //for checking if time ends
        if (gameLength == 0){
            gameTimer!.invalidate()
            
           // checkingHighScoreExistence()
            /*
            let destinationView = self.storyboard?.instantiateViewController(withIdentifier: "HighScoresListTableTableViewController") as! HighScoresListTableTableViewController
            self.navigationController?.pushViewController(destinationView, animated: true)
            present(destinationView, animated:  true, completion: nil)
            */
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:  nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HighScoresViewController") as! HighScoresViewController
            self.present(nextViewController, animated: true, completion: nil)
            
        }else{
            gameLength -= 1
        }
    }
    
    // set removeBubble function
    
    @objc func removeBubble(){
        
        var x = 0;
        
        while x < bubbleArray.count {
            
            // checking for 30 % possibility
            if arc4random_uniform(11) < 30 {
                let bubbleToBeRemoved = bubbleArray[x]
                
                // remove bubble(button) from super view
                bubbleToBeRemoved.removeFromSuperview()
                
                // remove bubble from array list
                bubbleArray.remove(at: x)
                
                // counter
                x += 1
            }
        }
    }
    
    // createBubble function
    
    @objc func createBubble(){
        // for generating random number 1 to 15
        let numberToCreate = arc4random_uniform(UInt32(bubbles - bubbleArray.count)) + 1
        var x = 0
        
        while x < numberToCreate{
            
            // create bubble
            
            bubble = Bubble()
            
            // set the bubble position
            
            bubble.frame = createRandomFrame()
            bubble.layer.cornerRadius = bubble.frame.height/2            // for frame overlap checking
            
            if !isOverlapped(newBubble:  bubble){
                
                // when the user tapped the bubble
                bubble.addTarget(self, action: #selector(bubbleTapped), for:  UIControl.Event.touchUpInside)
                
            // adding bubble to the view
                self.view.addSubview(bubble)
                
            // couner'
                x += 1
                
            // add bubble to array
                bubbleArray += [bubble]
            }
        }
        
        
    }
    
    // bubbleTapped function
    @IBAction func bubbleTapped(_ bubbleClicked: Bubble){
        
        bubbleClicked.removeFromSuperview()
        
        //for combo points
        if lastBubbleValue == bubbleClicked.value{
            currentScore += bubbleClicked.value * 1.5
            
        }
        else {
            currentScore += bubbleClicked.value
        }
        lastBubbleValue = bubbleClicked.value
        currenScoreLabel.text
         = "\(currentScore)"
        
        if previousRankingDictionary == nil {
            highestScore = currentScore
        
        }else if sortedHighScoreArray[0].value < currentScore {
            highestScore = currentScore
        }else if sortedHighScoreArray[0].value >= currentScore {
            highestScore = sortedHighScoreArray[0].value
        }
    }
    
    // isOverlapped function
    func isOverlapped (newBubble: Bubble)-> Bool{
        for existingBubble in bubbleArray {
            if newBubble.frame.intersects(existingBubble.frame){
                return true
            }
        }
        return false
    }
    
    // creatRandomFrame function
    
    func createRandomFrame() -> CGRect{
        
        let randomX = CGFloat(10 + arc4random_uniform(screenWidth - 2 * bubble.radius - 20))
        let randomY = CGFloat(170 + arc4random_uniform(screenHeight - 2 * bubble.radius - 160))
        
        return CGRect (x: randomX, y: randomY,
                       width: CGFloat(2 * bubble.radius),
                       height: CGFloat(2 * bubble.radius))
        

    }
    
    // saveHighScore function
    func saveHighScore(){
        
        rankingDictionary.updateValue(currentScore,  forKey: "playerName")
        UserDefaults.standard.set(rankingDictionary, forKey: "ranking")
        }
    
    // checkHighScoreExistence function
    func checkHighScoreExistence(){
        if previousRankingDictionary == nil {
            saveHighScore()
        }else {
            rankingDictionary = previousRankingDictionary!
            if rankingDictionary.keys.contains("playerName"){
                let oldScore = rankingDictionary["playerName"]!
                if oldScore < currentScore{
                    saveHighScore()
                }
            }else{
                saveHighScore()
            }
            
    }
        
        
        //end of class
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
