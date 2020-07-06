//
//  ViewController.swift
//  WarCardGame
//
//  Created by Quentin Sturner on 7/1/20.
//  Copyright © 2020 Quentin Sturner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var leftScoreLabel: UILabel!
    
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    @IBOutlet weak var leftBackView: UIImageView!
    
    @IBOutlet weak var rightBackView: UIImageView!
    
    var playerScore: Int = 0
    var cpuScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //leftBackView.isHidden = true
        //rightBackView.isHidden = true
    }
    
    @IBAction func dealTapped(_ sender: Any) {
        flipCards()
        
        // Creates random numbers to display different cards
        var leftNumber = Int.random(in: 2...14)
        var rightNumber = Int.random(in: 2...14)
        
        // Changes card image
        leftImageView.image = UIImage(named: "card\(leftNumber)")
        rightImageView.image = UIImage(named: "card\(rightNumber)")
        
        // War game logic
        if leftNumber > rightNumber {
            // Player wins round
            playerScore += 1
            leftScoreLabel.text = String(playerScore)
        } else if rightNumber > leftNumber {
            // Player loses round
            cpuScore += 1
            rightScoreLabel.text = String(cpuScore)
        } else {
            // Tie
            
        }
    }
    
    func flipCards() -> Void {
        //rightBackView.isHidden = false
        //leftBackView.isHidden = false
        UIView.transition(from: leftBackView, to: leftImageView, duration: 0.3, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil)
        
        UIView.transition(from: rightBackView, to: rightImageView, duration: 0.3, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil)
    }
    

}

