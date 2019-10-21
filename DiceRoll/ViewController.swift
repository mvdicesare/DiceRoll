//
//  ViewController.swift
//  DiceRoll
//
//  Created by Michael Di Cesare on 10/21/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var leftDiceImageView: UIImageView!
    @IBOutlet weak var rightDiceImageView: UIImageView!
    @IBOutlet weak var sumOfDiceLabel: UILabel!
    @IBOutlet weak var centerDiceImageView: UIImageView!
    @IBOutlet weak var numberOfDice: UISegmentedControl!
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var diceFour: UIImageView!
    @IBOutlet weak var diceFive: UIImageView!
    
    
    var statusBarStyle: UIStatusBarStyle = .lightContent
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centerDiceImageView.isHidden = true
        diceFour.isHidden = true
        diceFive.isHidden = true
        setupView()
        segmentedColor()
    }
    
    @IBAction func rollButtonPressed(_ sender: Any) {
                segmentControlPresed()
                segmentedColor()
    }
    func setupView(){
        sumOfDiceLabel.textColor = .white
        rollButton.setTitleColor(.white, for: .normal)
        
    }

    func segmentControlPresed() {
        let num1 = arc4random_uniform(6) + 1
        let num2 = arc4random_uniform(6) + 1
        let num3 = arc4random_uniform(6) + 1
        let num4 = arc4random_uniform(6) + 1
        let num5 = arc4random_uniform(6) + 1
        
        
        leftDiceImageView.image = UIImage(named: "Dice\(num1)")
        rightDiceImageView.image = UIImage(named: "Dice\(num2)")
        centerDiceImageView.image = UIImage(named: "Dice\(num3)")
        diceFour.image = UIImage(named: "Dice\(num4)")
        diceFive.image = UIImage(named: "Dice\(num5)")
      
        
        if numberOfDice.selectedSegmentIndex == 0 {
            centerDiceImageView.isHidden = true
            sumOfDiceLabel.text = "The sum of the dice are: \(num1 + num2)"
            diceFour.isHidden = true
            diceFive.isHidden = true
        } else if numberOfDice.selectedSegmentIndex == 1 {
            centerDiceImageView.isHidden = false
            sumOfDiceLabel.text = "The sum of the dice are: \(num1 + num2 + num3)"
            diceFour.isHidden = true
            diceFive.isHidden = true
        } else {
            centerDiceImageView.isHidden = false
            sumOfDiceLabel.text = "The sum of the dice are: \(num1 + num2 + num3 + num4 + num5)"
            diceFour.isHidden = false
            diceFive.isHidden = false
        }
    }
    func segmentedColor() {
        self.numberOfDice.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        self.numberOfDice.selectedSegmentTintColor = .cyan
        self.numberOfDice.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .selected)
    } 
}
