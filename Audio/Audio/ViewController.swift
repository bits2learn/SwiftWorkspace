//
//  ViewController.swift
//  Audio
//
//  Created by Nishant Chapa on 6/18/15.
//  Copyright (c) 2015 Bits2Learn. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()
    var error : NSError? = nil
    
     var isPlayButton = true
    
    @IBAction func play(sender: AnyObject) {
        
        player.play()
        isPlayButton = true
        playPauseButton()
       
    }
    
    
    @IBAction func stop(sender: AnyObject) {
        
        player.stop()
        player.currentTime = 0
        isPlayButton = false
        playPauseButton()
    }
    
    
    @IBAction func pause(sender: AnyObject) {
        
        player.pause()
        isPlayButton = false
        playPauseButton()
    }
    
    
    @IBAction func sliderChanged(sender: AnyObject) {
        
        player.volume = sliderValue.value
    }
    
    
    @IBOutlet var sliderValue: UISlider!
    
 
    @IBOutlet var toolbar: UIToolbar!
    
    func playPauseButton(){
        
        var new_button = UIBarButtonItem()
        
        if isPlayButton {
            
            new_button = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Pause, target: self, action: "pause:")
            
        } else {
            
            new_button = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Play, target: self, action: "play:")
            
        }
        
        var tb_items = toolbar.items
        tb_items?.removeAtIndex(0)
        tb_items?.insert(new_button, atIndex: 0)
        toolbar.setItems(tb_items, animated: true)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var audioPath = NSBundle.mainBundle().pathForResource("EyeOfTheTiger", ofType: "mp3")!
        
        player = AVAudioPlayer(contentsOfURL: NSURL(string: audioPath), error: &error)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

