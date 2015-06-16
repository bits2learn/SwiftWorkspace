//
//  ViewController.swift
//  Controlling The Keyboard
//
//  Created by Nishant Chapa on 3/24/15.
//  Copyright (c) 2015 BitsFriends. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var inputText: UITextField!
    
    @IBOutlet var outputLabel: UILabel!
    
    @IBAction func submitButton(sender: AnyObject) {
        
        outputLabel.text = inputText.text
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.inputText.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        inputText.resignFirstResponder();
        
        return true
        
    }


}

