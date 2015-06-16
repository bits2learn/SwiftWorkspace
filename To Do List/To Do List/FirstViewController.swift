//
//  FirstViewController.swift
//  To Do List
//
//  Created by Nishant Chapa on 3/24/15.
//  Copyright (c) 2015 BitsFriends. All rights reserved.
//

import UIKit

//Global variable which can be accessed by other viewcontrollers
var toDoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet var toDoListTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //onloading we will check if any data is already present previously. If so we retrieve that data
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
       
        toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //returns the total number of rows in the table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoList.count
    }
    
    //this function is used when we want to delete something while swiping to left
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        //check if we have clicked delete button after swiping to left
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            toDoList.removeAtIndex(indexPath.row)
            
            //storing the data permanently
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")

            toDoListTable.reloadData()
        }
        
    }

    
    
    //add the contents to the table row
    //we create an identifier which is also used in the prototype cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
    
        
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
        

    }

    //when we switch from second view to first we need to reload the data
    override func viewDidAppear(animated: Bool) {
        toDoListTable.reloadData()
    }

}

