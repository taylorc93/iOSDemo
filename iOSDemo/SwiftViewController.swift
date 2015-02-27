//
//  SwiftViewController.swift
//  iOSDemo
//
//  Created by Connor Taylor on 2/26/15.
//  Copyright (c) 2015 Comp150. All rights reserved.
//

import UIKit

class SwiftViewController: UIViewController {

    override func viewDidLoad(){
//        [PdBase sendFloat:0.0 toReceiver:@"test"];
        PdBase.sendFloat(0.0, toReceiver:"test")
        super.viewDidLoad()
        
        var center = NSNotificationCenter.defaultCenter()
        center.addObserver(self, selector: "receiveNotification:", name: "example", object: nil)
    }
    
    deinit{
        var center = NSNotificationCenter.defaultCenter()
        center.removeObserver(self)
    }
    
    func receiveNotification(notification: NSNotification){
        if let info = notification.userInfo as? Dictionary<String, String> {
            var anything: AnyObject?
            var button: UIButton = anything as UIButton
            var demo = info["demo"]
            println(demo!)
        }
        println("Got Notification")
    }
    
    @IBAction func displayNewVC(sender: AnyObject) {
        var storyboard = UIStoryboard(name: "Example", bundle: nil)

        var controller = storyboard.instantiateViewControllerWithIdentifier("exampleVC") as ExampleViewController
        
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        
    }
    
}
