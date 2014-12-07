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
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var counterInt:Int = Int(finalCounter) + 1
        var counterString:String = String(format: "%d", counterInt)
        counterLabel.text = counterString
        
        tempStr = counterString
        
        var gameScore = PFObject(className: "GameScore")
        
        var startStr = startPageURL.lastPathComponent
        startURL = startStr!.stringByReplacingOccurrencesOfString("_", withString: " ",options: NSStringCompareOptions.LiteralSearch,range: nil)
        
        var endStr = endPageURL.lastPathComponent
        lastURL = endStr!.stringByReplacingOccurrencesOfString("_", withString: " ",options: NSStringCompareOptions.LiteralSearch,range: nil)
        
    }
    
    @IBAction func submitScore(sender: AnyObject) {
        var initialsText = initials.text
        if (initialsText == "")
        {
            initialsText = "anon"
        }
        var object = PFObject(className: "RecentScores")
        object.setObject(startURL, forKey: "startPage")
        object.setObject(lastURL, forKey: "endPage")
        object.setObject(tempStr, forKey: "jumps")
        object.setObject(initialsText, forKey: "initials")
        object.saveInBackground()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
}

