//
//  ViewController.swift
//  TicTacToe
//
//  Created by Mike Pitre on 9/24/15.
//  Copyright © 2015 Mike Pitre. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //1 = Os, 2 = Xs
    
    var activePlayer = 1
    
    var gameActive = true
    
    var gameState = [0, 0, 0 , 0, 0, 0, 0, 0, 0]
    
    var winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var gameOverLabel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgainPressed(sender: AnyObject) {
        
        activePlayer = 1
        
        gameActive = true
        
        gameState = [0, 0, 0 , 0, 0, 0, 0, 0, 0]
        
        var button : UIButton
        
        for var i = 0; i < 9; i++ {
        
        button = view.viewWithTag(i) as! UIButton
        
        button.setImage(nil, forState: .Normal)
        
        }
        
        gameOverLabel.hidden = true
        playAgainButton.hidden = true
        
        gameOverLabel.alpha = 0
        
        playAgainButton.alpha = 0
        
    }
    
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if gameState[sender.tag] == 0 && gameActive == true {
        
            var image = UIImage()
        
            gameState[sender.tag] = activePlayer
        
            if activePlayer == 1 {
          
                image = UIImage(named: "o.png")!
            
                activePlayer = 2
            
            } else {
            
                if activePlayer == 2 {
                
                    image = UIImage(named: "x.png")!
                
                    activePlayer = 1
                
                }
        
            }
        
            sender.setImage(image, forState: .Normal)
            
            for combination in winningCombinations {
            
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    var labelText = "O Wins!"
                    
                    if gameState[combination[0]] == 2 {
                        
                        labelText = "X Wins!"
                    
                    }
                    
                    gameOverLabel.text = labelText
                    
                    gameOverLabel.hidden = false
                    playAgainButton.hidden = false
                        
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        
                        self.gameOverLabel.alpha = 1
                        
                        self.playAgainButton.alpha = 1
                        
                    })
                    
                    gameActive = false
                
                }
                
            }
            
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gameOverLabel.hidden = true
        playAgainButton.hidden = true
        
        gameOverLabel.alpha = 0
        
        playAgainButton.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        
        
        
    }
    
    
    


}

