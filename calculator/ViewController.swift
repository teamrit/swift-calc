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

    // Included to ensure the status bar color compatibility
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Display.numberOfLines=0;
        [Display sizeToFit];
        
        print(Display.frame.size.width)
        
        
        
        for button in self.AllButtons {
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            print("INIT")
        }
        
        
        
    }


    @IBAction func ButtonPressed(_ sender: UIButton) {
        // Declarations
        var pressedButtonText = sender.currentTitle!;
        var currentText = self.Display.text!;
        
        // Boolean Checks
        var isButtonPressedNumber = false;
        var castedNumber = Int(pressedButtonText);
        
        if (castedNumber != nil) {
            isButtonPressedNumber = castedNumber! >= 0;
        }
        
        print(isButtonPressedNumber, pressedButtonText);
        
        switch true {
        case (isButtonPressedNumber):
            print("Something" , pressedButtonText);
            self.Display.text = "\(Display.text!)\(pressedButtonText)";
            print(self.Display.text);
        default:
            print("Default");
        }

    }
}

