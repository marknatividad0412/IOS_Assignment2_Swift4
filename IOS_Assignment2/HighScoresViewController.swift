//
//  HighScoresViewController.swift
//  IOS_Assignment2
//
//  Created by Mark Anthony Natividad on 17/5/20.
//  Copyright © 2020 Mark Anthony Natividad. All rights reserved.
//

import UIKit

class HighScoresViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
   

}
extension HighScoresViewController: UITableViewDelegate{
       func tableView (_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
           
       }
   }
extension HighScoresViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 3
    }
    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighScoresList", for: indexPath)
        
        cell.textLabel?.text = "Hello World"
        return cell
    }
}
