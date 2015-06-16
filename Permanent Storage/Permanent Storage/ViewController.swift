//
//  ViewController.swift
//  Permanent Storage
//
//  Created by Nishant Chapa on 3/23/15.
//  Copyright (c) 2015 BitsFriends. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
       // NSUserDefaults.standardUserDefaults().setObject("Nishant", forKey: "name")
        
        var name = NSUserDefaults.standardUserDefaults().objectForKey("name")! as String
        
        println(name)
        
        var arr = [1,2,3,4]
        
      //  NSUserDefaults.standardUserDefaults().setObject(arr, forKey: "array")
        
        var recalledArray = NSUserDefaults.standardUserDefaults().objectForKey("array")! as NSArray
        
        println(recalledArray[3])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

