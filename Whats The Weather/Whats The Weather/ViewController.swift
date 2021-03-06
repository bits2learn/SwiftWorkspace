//
//  ViewController.swift
//  Whats The Weather
//
//  Created by Nishant Chapa on 3/26/15.
//  Copyright (c) 2015 BitsFriends. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userCity: UITextField!
    
    @IBAction func findWeather(sender: AnyObject) {
        
        var url = NSURL(string: "http://www.weather-forecast.com/locations/" + userCity.text.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest")
        
        if url != nil {
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
                
                var urlError = false
                
                var weather = ""
                
                if error == nil {
                    
                    var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding) as NSString!
                    
                    //println(urlContent)
                    
                    var urlContentArray = urlContent.componentsSeparatedByString("<span class=\"phrase\">")
                    
                    if urlContentArray.count > 1 {
                        
                        var weatherArray = urlContentArray[1].componentsSeparatedByString("</span>")
                        
                        weather = weatherArray[0] as String
                        
                        weather = weather.stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                        
                        
                    } else {
                        
                        urlError = true
                    }
                    
                } else {
                    
                    urlError = true
                }
                
                dispatch_async(dispatch_get_main_queue()) {
                    
                    
                    if urlError {
                       
                        self.showError()
                        
                    } else {
                        
                        self.resultLabel.text = weather
                    }
                }
                
            })
            
            task.resume()
            
        } else {
            
            showError()
        }

        
    }
    
    @IBOutlet var resultLabel: UILabel!
    
    
    func showError() {
        
        resultLabel.text = "Was not available to find weather for " + userCity.text + ". Please try again."
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

