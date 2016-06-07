//
//  ViewController.swift
//  Crosses and Noughts
//
//  Created by Tugce Tekerlekci on 11/21/15.
//  Copyright © 2015 Tugce Tekerlekci. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var gameOverLabel: UILabel!
    
    
    @IBAction func playAgain(sender: AnyObject) {
        
        activePlayer=1 //1,nodes ; 2,crosses....
        
        gameState = [0,0,0,0,0,0,0,0,0] //none of the buttons have been topped of yet
    
        gameActive=true

        gameOverLabel.hidden=true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x-500, gameOverLabel.center.y)
        
        playAgainButton.hidden=true
        
        playAgainButton.center = CGPointMake(gameOverLabel.center.x-500, gameOverLabel.center.y)
        
        var buttonToClear :UIButton
        
        for var i=0 ; i<9 ; i++
        {
            buttonToClear = view.viewWithTag(i) as! UIButton
            
            buttonToClear.setImage(nil, forState: .Normal)
        
        }
        
        
    
    }
    
    
    var activePlayer=1 //1,nodes ; 2,crosses....
    
    var gameState = [0,0,0,0,0,0,0,0,0] //none of the buttons have been topped of yet
    
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]] //all the winning combinations
    
    var gameActive=true
    
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonPressed(sender: AnyObject) {
    //name of the object :SENDER
        
        if (gameState[sender.tag] == 0 && gameActive==true)
    {
        gameState[sender.tag] = activePlayer
        
        if(activePlayer==1)
        {
            sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
            activePlayer=2
            
        }
        
        else
        {
            sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
            activePlayer=1
        
        
        }
        
        for combination in winningCombinations
        {   //all the same and not zero birisi basti tum nought yada crosslara demek
            
            
            
            if(gameState[combination[0]] != 0 && gameState[combination[0]]==gameState[combination[1]] && gameState[combination[1]]==gameState[combination[2]] )
            {
                
                gameActive=false
                if(gameState[combination[0]]==1)
                {
                    print("noughts has won")
                    gameOverLabel.text = "noughts has won"
                }
                
                else
                {
                     print("crosses has won")
                    gameOverLabel.text = "crosses has won"
                
                }
                
                gameOverLabel.hidden = false;
                playAgainButton.hidden = false;
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x+500, self.gameOverLabel.center.y)
                    self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x+500,self.playAgainButton.center.y)
                
                
                })
            
            }
            gameActive=false
            
            for buttonState in gameState
            {
                if (buttonState == 0)
                {
                    gameActive = true
                }
            
            }
        
        }
        
        
        
    }
        
        
        
    
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameOverLabel.hidden=true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x-500, gameOverLabel.center.y)
    
        playAgainButton.hidden=true
        
        playAgainButton.center = CGPointMake(gameOverLabel.center.x-500, gameOverLabel.center.y)
    
    
    
    
    
    
    
    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

