//
//  ViewController.swift
//  calculator
//
//  Created by Singh Singh on 2019-05-15.
//  Copyright © 2019 teamrit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var AllButtons: [UIButton]!
    
    @IBOutlet weak var Display: UILabel!

    let ADDITION = "+";
    let SUBTRACTION = "+";
    let MULTIPLICATION = "+";
    let DIVISION = "+";
    
    let operatorApplied = false;

    
    let operators = ["+" , "-" , "*", "/"];
    
    // Included to ensure the status bar color compatibility
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(Display.frame.size.width)
        
        Display.translatesAutoresizingMaskIntoConstraints = false
        Display.addConstraint(NSLayoutConstraint(item: Display, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: Display.frame.size.width))
        
        
        for button in self.AllButtons {
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
        }
        
    }


    @IBAction func ButtonPressed(_ sender: UIButton) {
        // Declarations
        let pressedButtonText = sender.currentTitle!;
        let currentText = self.Display.text!;
        
        // Boolean Checks
        
        // a -> Checks for number
        var isButtonPressedNumber = false;
        let castedNumber = Int(pressedButtonText);
        if (castedNumber != nil) {
            isButtonPressedNumber = castedNumber! >= 0;
        }
        
        // b -> Checks for delete enter.
        let isDeleteButton = sender.currentTitle == "Del";
        
        // c -> Checks for an operator.
        let isOperator = operators.contains(pressedButtonText)
        
        // d -> Checks if "C" is pressed
        let isClearPressed = sender.currentTitle == "C";
        
        switch true {
        case (isButtonPressedNumber):
            print("Something" , pressedButtonText);
            let newText = Display.text! == "0" ? "" : Display.text!;
            self.Display.text = "\(newText)\(pressedButtonText)";
            
        case (isDeleteButton):
            let digits = currentText;
            if (currentText.count != 0 ) {
                let index1 =
                    currentText.count == 1 ?
                        nil : digits.index(digits.endIndex, offsetBy: -2)
                self.Display.text = currentText.count == 1 ? String(0) : String(digits[...index1!]);
            }
        case (isClearPressed) :
            // FUTURE: History needs to be cleared at this point.
            print("Clear Pressed")
            self.Display.text = "0";
            
        case (isOperator) :
            switch (pressedButtonText) {
                case ("+") :
                    print("+")
                default :
                    print("Default")
                
            }
            
        default:
            print("Default");
        }

    }
}

