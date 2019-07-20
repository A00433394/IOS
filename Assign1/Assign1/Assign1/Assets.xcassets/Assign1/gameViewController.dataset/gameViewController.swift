//
//  gameViewController.swift
//  Assign1
//
//  Created by cda2019 on 2019-07-19.
//  Copyright © 2019 SMU. All rights reserved.
//

import UIKit

class gameViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var numberFeild: UITextField!
    @IBOutlet weak var inputFeild: UITextField!
    var score:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setNumber()
        updateScore()
        
        inputFeild?.addTarget(self, action: #selector(textFeildDidChange(textField:)), for: UIControl.Event.editingChanged)
        // Do any additional setup after loading the view.
    }
    
    @objc func textFeildDidChange(textField:UITextField){
        if inputFeild.text?.characters.count ?? 0 < 4
        {
            return
        }
        
        if let numbers_text = numberFeild?.text,
        let input_text = inputFeild?.text,
        let numbers = Int(numbers_text),
            let input = Int(input_text){
            print("Comparing: \(input_text) minus \(numbers_text) == \(input - numbers)")
            
            if (input-numbers == 1){
                print("Correct")
                score += 1
            }else {
                print("Incorrect")
                score -= 1
            }
            inputFeild?.text = ""
        }
       alertReplay()
        setNumber()
        updateScore()
    }
    
    func alertReplay(){
        if score == 5{
            let alertController = UIAlertController(title: "YOU WIN!!", message: "You have completed the game getting a score of: \(score) points. Congrats!!", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "REPLAY", style: .default, handler: nil)
            alertController.addAction(restartAction)
            
            self.present(alertController, animated: true, completion: nil)
        
        }
    }
    func generateRandomNumber() -> String{
        var result:String = ""
        for _ in 1...4{
            let digit = Int.random(in: 0..<9)
            result += "\(digit)"
        }
        return result
    }
    
    func updateScore(){
        scoreLabel?.text = "\(score)"
    }
    
    func setNumber(){
        numberFeild?.text = generateRandomNumber()
    }

}
