//
//  ViewController.swift
//  Is It Prime
//
//  Created by Nishant Chapa on 3/17/15.
//  Copyright (c) 2015 BitsFriends. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var numberBox: UITextField!
    @IBOutlet var resultText: UILabel!
    
    @IBAction func primeNumberButton(sender: AnyObject) {
        
        var  input = numberBox.text.toInt()
        
        if input != nil {
            
            var unarappedNumber = input!
            
            var isPrime = true
            
            if unarappedNumber <= 1 {
               isPrime = false
            }
            
            if unarappedNumber != 1 && unarappedNumber != 2 {
                
                for var i=2; i<unarappedNumber ; i++ {
                    
                    if unarappedNumber % i == 0 {
                        isPrime = false
                    }
                }
            }
            
            if isPrime == true {
                resultText.text = "\(unarappedNumber) is a Prime number"
            } else {
                resultText.text = "\(unarappedNumber) is not a Prime number"
            }
            
        } else {
            resultText.text = "Please enter a number in the box"
        }
        
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

