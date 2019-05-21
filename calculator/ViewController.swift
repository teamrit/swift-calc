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
    let SUBTRACTION = "-";
    let MULTIPLICATION = "*";
    let DIVISION = "=";
    
    let SQUARE = "x²";
    
    let FIRST_OPERATOR = "FIRST_OPERATOR";
    
    let operatorApplied = false;
    
    var currentOperator = "";
    
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
        
        _setButtonsProgrammaticDesign();
        
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
        
        // e -> Negator is pressed
        let isNegatorPressed = sender.currentTitle == "+/-";
        
        // f -> When a decimal is pressed.
        let isDecimalPressed = sender.currentTitle == ".";
        
        // g -> Check if Square a number is pressed
        let isSquarePressed = sender.currentTitle == SQUARE;
        
        var FIRST_OPERATOR = "";
        
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
            case (isNegatorPressed) :
                print("Negator pressed")
                
                let index = currentText.index(currentText.startIndex, offsetBy: 1)
                print(currentText[index...])
                
                self.Display.text = currentText.contains("-") ?
                    "\(currentText[index...])" : "-\(currentText)";
                let defaults = UserDefaults.standard
                if let stringOne = defaults.string(forKey: FIRST_OPERATOR) { print(stringOne)

            }
            
            case (isClearPressed) :
                // FUTURE: History needs to be cleared at this point.
                print("Clear Pressed")
                self.Display.text = "0";
            case (isDecimalPressed) :
                if (!currentText.contains(".")) {
                    self.Display.text = "\(currentText).";
                }
            case (isOperator) :
                // _setStringInStore(key: FIRST_OPERATOR, value: currentText);
                switch (pressedButtonText) {
                    case ("+") :
                        if (currentOperator == "") {
                            let firstOperator = _getStringFromStore(key: FIRST_OPERATOR)
                            
                            if (firstOperator != "Error") {
                                let result = _doArithmetic(firstNumber: firstOperator, arithmeticSign: ADDITION, secondNumber: currentText)
                                self.Display.text = result;
                            } else {
                                self.Display.text = "0";
                            }
                            _setStringInStore(key: FIRST_OPERATOR, value: currentText)
                        } else {
                            
                        }
                       
                    default :
                        print("Default")
                    
                }
            case (isSquarePressed) :
                var result = _doArithmetic(firstNumber: currentText, arithmeticSign: MULTIPLICATION, secondNumber: currentText)
                print(result)
                self.Display.text = result
            
            default:
                print("Default");
        }

    }
    
    func _setStringInStore(key : String, value: String) {
        // Setting
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key )
    }
    
    func _setButtonsProgrammaticDesign() {
        for button in self.AllButtons {
            button.layer.cornerRadius = 22
            button.layer.borderWidth = 1
            button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    func _getStringFromStore(key : String) -> String {
        let defaults = UserDefaults.standard
        if let stringOne = defaults.string(forKey: key) {
            return (stringOne)
        } else {
            return "Error"
        }
    }
    
    func _doArithmetic(firstNumber: String, arithmeticSign: String, secondNumber: String) -> String {
        switch arithmeticSign {
        case "+":
            let first = Float(firstNumber);
            let second = Float(secondNumber);
            if (first != nil && second != nil) {
                return String(first! + second!);
            }
            return "Error";
        case MULTIPLICATION:
            let first = Float(firstNumber);
            let second = Float(secondNumber);
            if (first != nil && second != nil) {
                return String(first! * second!);
            }
            return "Error";
        default:
            print("Default")
        }
        return "Default";
    }
    
}

