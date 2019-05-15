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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for button in self.AllButtons {
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            print("INIT")
        }
        
        
        
    }


    @IBAction func ButtonPressed(_ sender: UIButton) {
        print("button pressed");
        print(sender.currentTitle!);
        
        
        
        var text = sender.currentTitle!;
        var currentText = self.Display.text!;
        self.Display.text = currentText + sender.currentTitle!;

    }
}

