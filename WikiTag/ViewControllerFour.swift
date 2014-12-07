//
//  ViewControllerFour.swift
//  WikiTag
//
//  Created by James Hotchkiss on 11/26/14.
//  Copyright (c) 2014 James Hotchkiss. All rights reserved.
//

import UIKit

class ViewControllerFour:UIViewController  {
    
    @IBOutlet var counterLabel: UILabel!
    @IBOutlet var initials: UITextField!
    
    var finalCounter:Double!
    var tempStr:String!
    
    var startPageURL:NSURL!
    var endPageURL:NSURL!
    
    var startURL:String!
    var lastURL:String!
    
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view
        super.viewDidLoad()
        
        // fix fencepost problem and print the counter
        var counterInt:Int = Int(finalCounter) + 1
        var counterString:String = String(format: "%d", counterInt)
        counterLabel.text = counterString
        
        tempStr = counterString
        
        var gameScore = PFObject(className: "GameScore")
        
        // convert origin to plain text
        var startStr = startPageURL.lastPathComponent
        startURL = startStr!.stringByReplacingOccurrencesOfString("_", withString: " ",options: NSStringCompareOptions.LiteralSearch,range: nil)
        
        // convert end to plain text
        var endStr = endPageURL.lastPathComponent
        lastURL = endStr!.stringByReplacingOccurrencesOfString("_", withString: " ",options: NSStringCompareOptions.LiteralSearch,range: nil)
    }
    
    // if the user doesn't submit initials, call them anon
    @IBAction func submitScore(sender: AnyObject) {
        var initialsText = initials.text
        if (initialsText == "")
        {
            initialsText = "anon"
        }
        // load into parse database
        var object = PFObject(className: "RecentScores")
        object.setObject(startURL, forKey: "startPage")
        object.setObject(lastURL, forKey: "endPage")
        object.setObject(tempStr, forKey: "jumps")
        object.setObject(initialsText, forKey: "initials")
        object.saveInBackground()
    }
    
    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
        super.didReceiveMemoryWarning()
        
    }
    
   
}

