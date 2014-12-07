//
//  ViewControllerFour.swift
//  WikiTag
//
//  Created by James Hotchkiss on 11/26/14.
//  Copyright (c) 2014 James Hotchkiss. All rights reserved.
//

import UIKit

class ViewControllerFour: UIViewController {
    
    @IBOutlet var counterLabel: UILabel!
    var finalCounter:Double!
    
    @IBOutlet var initials: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var counterInt:Int = Int(finalCounter) + 1
        var counterString:String = String(format: "%d", counterInt)
        counterLabel.text = counterString
        
        var gameScore = PFObject(className: "GameScore")
        
    }
    
    @IBAction func submitScore(sender: AnyObject) {
        var initialsText = initials.text
        var object = PFObject(className: "RecentScores")
        object.addObject("Jump1", forKey: "startPage")
        object.addObject("Jump2", forKey: "endPage")
        object.addObject(Int(finalCounter) + 1, forKey: "jumps")
        object.addObject(initialsText, forKey: "initials")
        object.saveInBackground()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
}

