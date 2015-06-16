//
//  ViewController.swift
//  Animations
//
//  Created by Nishant Chapa on 3/31/15.
//  Copyright (c) 2015 BitsFriends. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter = 1
    
    var timer = NSTimer()
    
    var isAnimating = true
    
    @IBOutlet var alienImage: UIImageView!
    
    
    @IBAction func updateImage(sender: AnyObject) {
        
        if isAnimating == true {
            
            timer.invalidate()
            
            isAnimating = false
            
        } else {
            
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
            
            isAnimating = true
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
    }
    
    func doAnimation() {
        
        counter++
        
        if counter == 6 {
            counter = 1
        }
        
        alienImage.image = UIImage(named: "frame\(counter).png")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    
    //Using inbuilt swift animation function
    
    //function is called before the layout appears
    override func viewDidLayoutSubviews() {
        
        //setting the image to be out of the bounds of the layout at the start
        //alienImage.center = CGPointMake(alienImage.center.x-400, alienImage.center.y)
        
        //if alpha = 0 then the image is not visible to the user
        //alienImage.alpha = 0
        
        //frame is used to define the image location (x,y, width, height)
        alienImage.frame = CGRectMake(100, 20, 0, 0)
    }
    
    //function is called when the view appears on the layout
    override func viewDidAppear(animated: Bool) {
        
        //setting the inbuilt swift animation which will move the image to the center position
        UIView.animateWithDuration(1, animations: { () -> Void in
            
            //self.alienImage.center = CGPointMake(self.alienImage.center.x+400, self.alienImage.center.y)
            
            //image appears on screen in a second
            //self.alienImage.alpha = 1
            
            self.alienImage.frame = CGRectMake(100, 20, 100, 200)
        })
    }
    
    */

}

