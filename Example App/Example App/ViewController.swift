//
//  ViewController.swift
//  Example App
//
//  Created by Nishant Chapa on 3/15/15.
//  Copyright (c) 2015 BitsFriends. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myLabel: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        myLabel.text = "It Worked!"
        
        if myLabel.textColor == UIColor.greenColor() {
            myLabel.textColor = UIColor.redColor()
        }
        else if myLabel.textColor == UIColor.redColor() {
            myLabel.textColor = UIColor.greenColor()
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

