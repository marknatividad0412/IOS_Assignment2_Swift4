//
//  HighScoresViewController.swift
//  IOS_Assignment2
//
//  Created by Mark Anthony Natividad on 17/5/20.
//  Copyright © 2020 Mark Anthony Natividad. All rights reserved.
//

import UIKit

class HighScoresViewController: UIViewController {

    var highScores: [HighScoresList] = []
    var rankingDictionary = [String : Double]()
    var previousRankingDictionary: Dictionary? = [String : Double]()
    var sortedHighScoreArray = [(key: String, value: Double)]()


    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        
        tableView.dataSource = self
        previousRankingDictionary = UserDefaults.standard.dictionary(forKey: "ranking") as? Dictionary<String,Double>
        if previousRankingDictionary != nil{
            rankingDictionary = previousRankingDictionary!
            sortedHighScoreArray = rankingDictionary.sorted(by: {$0.value > $1.value})
            highScores = loadHighScores()
        }
        // Do any additional setup after loading the view.
       
    }
     func loadHighScores() -> [HighScoresList]{
               
               var list: [HighScoresList] = []
           
          for scoreList in sortedHighScoreArray{
               let player = HighScoresList(playerName: scoreList.key, playerScore: scoreList.value)
               list.append(player)
           }
    
               
               return list;
               
            }

}
extension HighScoresViewController: UITableViewDelegate{
       func tableView (_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
           
       }
   }
extension HighScoresViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return sortedHighScoreArray.count
    }
    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HighScoresTableViewCell
        
        let list = highScores[indexPath.row]
        cell.playerNameLabel.text = list.playerName;
        cell.playerScoreLabel.text = String(list.playerScore);
            

        return cell
    }
}
