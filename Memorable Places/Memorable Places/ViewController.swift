//
//  ViewController.swift
//  Memorable Places
//
//  Created by Nishant Chapa on 6/17/15.
//  Copyright (c) 2015 BitsFriends. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    var manager:CLLocationManager!
    
    @IBOutlet var map: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        if activePlace == -1 {
        
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
            
        } else {
            
            var latitude = NSString(string: places[activePlace]["lat"]!).doubleValue
            
            var longitude = NSString(string: places[activePlace]["lon"]!).doubleValue
            
            var coordinate = CLLocationCoordinate2DMake(latitude, longitude)
            
            var latDelta:CLLocationDegrees = 0.01
            
            var lonDelta:CLLocationDegrees = 0.01
            
            var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
            
            var region:MKCoordinateRegion = MKCoordinateRegionMake(coordinate, span)
            
            self.map.setRegion(region, animated: true)
            
            var annotation = MKPointAnnotation()
            
            annotation.coordinate = coordinate
            
            annotation.title = places[activePlace]["name"]
            
            self.map.addAnnotation(annotation)
        }
        
        
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        
        uilpgr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilpgr)
    }
    
    func action(gestureRecognizer:UIGestureRecognizer) {
        
        if (gestureRecognizer.state == UIGestureRecognizerState.Began) {
            
            var touchPoint = gestureRecognizer.locationInView(self.map)
            
            var newCoordinate = self.map.convertPoint(touchPoint, toCoordinateFromView: self.map)
            
            var location = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
            
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
                
                var title = ""
                var alreadyExistingPlace:Bool = false
                
                if (error == nil) {
                    
                    if let p = CLPlacemark(placemark: placemarks?[0] as! CLPlacemark) {
                        
                        var subThoroughfare:String = ""
                        var thoroughfare:String = ""
                        
                        if p.subThoroughfare != nil {
                            
                            subThoroughfare = p.subThoroughfare
                        }
                        
                        if p.thoroughfare != nil {
                            
                            thoroughfare = p.thoroughfare
                        }
                        
                        title = "\(subThoroughfare) \(thoroughfare)"
                        
                    }
                    
                }
                
                if title == "" {
                    
                    title = "Added \(NSDate())"
                }
                
                for var index=0; index<places.count; index++ {
                    
                    if places[index]["name"]! == title {
                        alreadyExistingPlace = true
                    }
                }
                
                if alreadyExistingPlace == false {
                
                    places.append(["name":title, "lat":"\(newCoordinate.latitude)", "lon":"\(newCoordinate.longitude)"])
                
                    //updating the permanent storgae data
                    NSUserDefaults.standardUserDefaults().setObject(places, forKey: "places")
                    
                }
                
                var annotation = MKPointAnnotation()
                
                annotation.coordinate = newCoordinate
                
                annotation.title = title
                
                self.map.addAnnotation(annotation)
            })
            
            
        }
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        var userLocation:CLLocation = locations[0] as! CLLocation
        
        var latitude = userLocation.coordinate.latitude
        
        var longitude = userLocation.coordinate.longitude
        
        var coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        
        var latDelta:CLLocationDegrees = 0.01
        
        var lonDelta:CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(coordinate, span)
        
        self.map.setRegion(region, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

