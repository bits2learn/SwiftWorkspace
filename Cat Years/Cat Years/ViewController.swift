//
//  ViewController.swift
//  Cat Years
//
//  Created by Nishant Chapa on 3/16/15.
//  Copyright (c) 2015 BitsFriends. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var catAge: UITextField!
    @IBOutlet var catYears: UILabel!
    @IBAction func findAgeButton(sender: AnyObject) {
        
        var enteredAge = catAge.text.toInt()
        
        if enteredAge != nil {
        
            var catActualAge = enteredAge! * 7
        
            catYears.text = "Your cat is \(catActualAge) in cat years"
            
        } else {
            catYears.text = "Please enter a number in the box"
           // catYears.numberOfLines = 2
           // catYears.lineBreakMode = NSLineBreakMode.ByWordWrapping
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

