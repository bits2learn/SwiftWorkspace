//
//  SecondViewController.swift
//  To Do List
//
//  Created by Nishant Chapa on 3/24/15.
//  Copyright (c) 2015 BitsFriends. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var item: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        
        //add iterm to the array
        toDoList.append(item.text)
        
        //refresh the text box after adding the data
        item.text = ""
        
        //updating the permanent storgae data
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //this will hide the keyboard
        self.item.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //check if we have touched outside of a text box, so that we can hide the keyboard
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
        
    }

    //hide the keyboard when we click on the return key
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        item.resignFirstResponder()
        return true
    }

}

