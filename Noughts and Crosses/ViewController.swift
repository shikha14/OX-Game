//
//  ViewController.swift
//  Noughts and Crosses
//
//  Created by Shikha Gupta on 10/11/16.
//  Copyright © 2016 shikha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let noughtPlayerValue = 1
    let crossesPlayerValue = 2
    
    
    var noughtPlayer = true
    var gameActive = true
    
    var gameState = [0,0,0,0,0,0,0,0,0]
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var playAgain: UIButton!
    
    
    
    @IBAction func restartGame(sender: AnyObject) {
        noughtPlayer = true
        gameActive = true
        gameState = [0,0,0,0,0,0,0,0,0]
        
        hideViews()
        clearButtonBackground()
        
    }
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if gameState[sender.tag] == 0 && gameActive == true
        {
            if noughtPlayer
            {
                gameState[sender.tag]=noughtPlayerValue
                sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
                noughtPlayer = !noughtPlayer
            }else{
                gameState[sender.tag]=crossesPlayerValue
                sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
                noughtPlayer = !noughtPlayer
            }
            
            for combination in winningCombinations
            {
                if(gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]])
                {
                    gameActive = false
                    if gameState[combination[0]] == noughtPlayerValue
                    {
                        print("Nought Won")
                        gameOverLabel.text = "Nought have Won!"
                        
                    }else if gameState[combination[0]] == crossesPlayerValue
                    {
                        print("Crosses Won")
                        gameOverLabel.text = "Crosses have Won!"
                    }
                    
                    endGame()
                }
                
            }
            
            if gameActive == true{
                gameActive = false
                
                for buttonState in gameState
                {
                    if buttonState == 0
                    {
                        gameActive = true
                    }
                }
                
                
                if gameActive == false
                {
                    gameOverLabel.text = "It's a draw!!"
                    endGame()
                }
                
            }
        }
        
        
    }
    
    func endGame()
    {
        gameOverLabel.hidden = false
        playAgain.hidden = false
        UIView.animateWithDuration(0.5, animations: {
            self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 500,self.gameOverLabel.center.y)
            
            
        })
        
        UIView.animateWithDuration(0.5, animations: {
            self.playAgain.center = CGPointMake(self.playAgain.center.x + 500,self.playAgain.center.y)
            
            
        })
        
    }
    
    func hideViews()
    {
        gameOverLabel.hidden = true
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        
        playAgain.hidden = true
        playAgain.center = CGPointMake(playAgain.center.x - 500, playAgain.center.y)
        
    }
    
    func clearButtonBackground()
    {
        var buttonToClear : UIButton
        
        for var i = 0 ;i < 9 ; i = i+1 {
            buttonToClear = view.viewWithTag(i) as! UIButton
            buttonToClear.setImage(nil, forState: .Normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideViews()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

