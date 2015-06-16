//
//  ViewController.swift
//  Stopwatch
//
//  Created by Nishant Chapa on 3/22/15.
//  Copyright (c) 2015 BitsFriends. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var time: UILabel!
    
    var timer = NSTimer()
    
    var msCount = 0
    
    var isPauseButton = false
    
    var isPlayButton = true
    
    func updateTime() {
        msCount++
        let msec = String(format: "%02d", msCount%100)
        
        let sec = String(format: "%02d", msCount/100%60)
        
        let min = String(format: "%02d", msCount/100/60%60)
        
        let hour = String(format: "%02d", msCount/100/60/60%60)
        
        time.text = "\(hour):\(min):\(sec):\(msec)"
        
        //time.text = String(msCount)
    }
    
    @IBAction func pause(sender: AnyObject) {
        
        timer.invalidate()
        
        playPauseButton()
        
        isPlayButton = true
    }
    
    
    @IBAction func stop(sender: AnyObject) {
        
        timer.invalidate()
        
        msCount = 0
        
        time.text = "00:00:00:00"
    }
    
    @IBAction func play(sender: AnyObject) {
        
        
        if !timer.valid {
            
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
            
            playPauseButton()
            
            isPlayButton = false
            
            }
        
    }
    
    /*
    * To toggle the play and pause buttons
    * 1. Get a link for the toolbar where you have placed the play button
    * 2. Create a function playPauseButton() which will be called each time we click the button
    * 3. Here we create a new button object as below:
    * new_button = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Pause, target: self, action: "pause:")
    * 4. Then we need to remove the existing button from the tool bar and then insert the new_button at that position
    */
    @IBOutlet var toolbar: UIToolbar!
    
    func playPauseButton(){
        
        var new_button = UIBarButtonItem()
        
        if isPlayButton {
            
            new_button = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Pause, target: self, action: "pause:")
            
        } else {
            
            new_button = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Play, target: self, action: "play:")
            
        }
        
        var tb_items = toolbar.items
        tb_items?.removeAtIndex(2)
        tb_items?.insert(new_button, atIndex: 2)
        toolbar.setItems(tb_items, animated: true)
        
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

