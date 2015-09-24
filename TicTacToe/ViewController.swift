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

    @IBOutlet weak var button: UIButton!
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        var image = UIImage()
        
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
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

