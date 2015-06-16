//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Nishant Chapa on 4/2/15.
//  Copyright (c) 2015 BitsFriends. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //1 = noughts, 2 = crosses
    
    var activePlayer = 1
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    var gameActive = true
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var messageLabel: UILabel!
    
    @IBOutlet var playAgainButton: UIButton!
    
    
    @IBAction func playAgainButtonPressed(sender: AnyObject) {
        
        activePlayer = 1
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        gameActive = true
        
        var button : UIButton
        
        for var i = 0; i < 9; i++ {
            
            button = view.viewWithTag(i) as UIButton!
            
            button.setImage(nil, forState: .Normal)
        }
        
        messageLabel.hidden = true
        playAgainButton.hidden = true
        
        messageLabel.center = CGPointMake(messageLabel.center.x - 400, messageLabel.center.y)
        
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)

    }
   
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if gameState[sender.tag] == 0 && gameActive == true {
        
            var image = UIImage()
            
            gameState[sender.tag] = activePlayer
        
            if activePlayer == 1 {
        
                image = UIImage(named: "nought.png")!
                
                activePlayer = 2
                
            } else {
            
                image = UIImage(named: "cross.png")!
            
                activePlayer = 1
            }
        
            sender.setImage(image, forState: .Normal)
            
            for combination in winningCombinations {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    
                    var labelText = "Noughts have won!"
                    
                    if gameState[combination[0]]  == 2 {
                        
                        labelText = "Crosses have won!"
                    
                    }
                    
                    messageLabel.text = labelText
                    
                    messageLabel.hidden = false
                    playAgainButton.hidden = false
                    
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        
                        self.messageLabel.center = CGPointMake(self.messageLabel.center.x - 400, self.messageLabel.center.y)
                        
                        self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x - 400, self.playAgainButton.center.y)
                        
                    })
                    
                    gameActive = false
                    
                    
                }
            }
        }
        
        var counter = 0
        
        for var j = 0; j < 9 ; j++ {
            
            if gameState[j] == 0 {
                
                counter++
            }
            
        }
        
        if counter == 0  && gameActive == true {
            
            messageLabel.text = "We have no winner"
            
            messageLabel.hidden = false
            playAgainButton.hidden = false
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                
                self.messageLabel.center = CGPointMake(self.messageLabel.center.x - 400, self.messageLabel.center.y)
                
                self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x - 400, self.playAgainButton.center.y)
                
            })
            
            gameActive = false
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        messageLabel.hidden = true
        playAgainButton.hidden = true
        
        messageLabel.center = CGPointMake(messageLabel.center.x - 400, messageLabel.center.y)
        
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        
       
    }


}

