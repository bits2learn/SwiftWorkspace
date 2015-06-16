//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Nishant Chapa on 3/24/15.
//  Copyright (c) 2015 BitsFriends. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //define the URL
        let url = NSURL(string: "http://www.stackoverflow.com")
        
        //below is the way of defining a closure
        //here we will download the contents of the webpage and display in the app
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            (data, response, error) in
            
            if error == nil {
                
                //we need to convert data to human readable format using UTF8 encoding
                var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                
                println(urlContent)
                
                //it stops waiting for anything else to happen and do the below update immediately
                //this is particularly useful if it takes 15-20 seconds to load the page
                dispatch_async(dispatch_get_main_queue()) {
                    
                    //we have to get out of closure to access the webView variable
                    self.webView.loadHTMLString(urlContent!, baseURL: nil)
                }
            }
        }
        
        //this will actually start the task of executing the above code
        task.resume()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

