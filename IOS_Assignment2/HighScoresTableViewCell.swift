//
//  HighScoresTableViewCell.swift
//  IOS_Assignment2
//
//  Created by Mark Anthony Natividad on 19/5/20.
//  Copyright © 2020 Mark Anthony Natividad. All rights reserved.
//

import UIKit

class HighScoresTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var playerNameLabel: UILabel!
    
    
    @IBOutlet weak var playerScoreLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
