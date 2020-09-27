//
//  ViewController.swift
//  app2_yu_lauren
//
//  Created by user181204 on 9/17/20.
//  Copyright © 2020 user181204. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var p1_score: UILabel!
    @IBOutlet weak var p2_score: UILabel!
    @IBOutlet weak var game_state: UILabel!
    @IBOutlet var collection:[UIButton]!
   
    @IBOutlet weak var playAgain: UIButton!
    
    var count = 1
    var activePlayer = 1
    var scorep1 = 0
    var scorep2 = 0
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var active = true
    let winning = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    let x_button = UIImage(named: "mark-x")?.withRenderingMode(.alwaysTemplate)
    let o_button = UIImage(named: "mark-o")?.withRenderingMode(.alwaysTemplate)
    
    @IBAction func action(_ sender: AnyObject)
    {
        if (gameState[sender.tag] == 0 && active == true) {
            gameState[sender.tag] = activePlayer
         
        if (activePlayer == 1) {
            game_state.text = "Player 2's Turn"
            game_state.textColor = UIColor.systemRed
            sender.setImage(x_button, for: .normal)
            activePlayer = 2
          
        } else {
            game_state.text = "Player 1's Turn"
            game_state.textColor = UIColor.systemGreen 
            sender.setImage(o_button, for: .normal)
            activePlayer = 1
        }
        }
        
        for combo in winning {
            if (gameState[combo[0]] != 0 && gameState[combo[0]] == gameState[combo[1]] && gameState[combo[1]] == gameState[combo[2]]) {
                active = false
                game_state.textColor = UIColor.systemBlue
                
                if (gameState[combo[0]] == 1) {
                    for button in collection {
                        for num in combo {
                            if (button.tag == num) {
                                button.tintColor = UIColor.systemYellow
                            }
                            
                        }
                    }
                    
                    game_state.text = "Player 1 has won the game"
                    scorep1 = scorep1 + 1
                    p1_score.text = "\(scorep1)"
                    playAgain.isHidden = false
          
                    
                } else {
                    for button in collection {
                        for num in combo {
                            if (button.tag == num) {
                                button.tintColor = UIColor.systemYellow
                            }
                            
                        }
                    }
                    game_state.text = "Player 2 has won the game"
                    scorep2 = scorep2 + 1
                    p2_score.text = "\(scorep2)"
                    playAgain.isHidden = false
                                    
                }
            } else {
                    var bool = true
                    for i in gameState {
                        if (i == 0) {
                            bool = false
                        }
                    }
                    if (bool == true) {
                        game_state.text = "Player 1 and 2 have tied"
                        for button in collection {
                            button.tintColor = UIColor.systemGray
                        }
                        playAgain.isHidden = false
                    }
                }
            
            }
    }
    
    @IBAction func playAgainFunc(_ sender: Any) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        active = true
        activePlayer = 1
        playAgain.isHidden = true
        game_state.text = "Player 1's Turn"
        for button in collection {
            button.setImage(UIImage(named: "mark-none"), for: .normal)
            button.tintColor = UIColor.systemBlue
        }
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playAgain.isHidden = true
        
    }
}

