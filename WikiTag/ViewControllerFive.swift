//
//  ViewControllerFive.swift
//  WikiTag
//
//  Created by James Hotchkiss on 11/26/14.
//  Copyright (c) 2014 James Hotchkiss. All rights reserved.
//

import UIKit

class ViewControllerFive: UIViewController {
    
    // make a bunch of labels in the worst possible way
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    @IBOutlet weak var label10: UILabel!
    @IBOutlet weak var label11: UILabel!
    @IBOutlet weak var label12: UILabel!
    @IBOutlet weak var label13: UILabel!
    @IBOutlet weak var label14: UILabel!
    @IBOutlet weak var label15: UILabel!
    @IBOutlet weak var label16: UILabel!
    
    
    // create an array that will give better access to database contents
    var dataParse:NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view
        super.viewDidLoad()
        
        // query the contents of the database and load into array
        var query = PFQuery(className: "RecentScores")
        query.orderByDescending("createdAt")
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            
            for object: AnyObject in objects
            {
                self.dataParse.addObject(object)
            }
            
            // set the text on the labels from the Parse database
            self.label1.text = self.dataParse[0].valueForKey("startPage") as? String
            self.label5.text = self.dataParse[1].valueForKey("startPage") as? String
            self.label9.text = self.dataParse[2].valueForKey("startPage") as? String
            self.label13.text = self.dataParse[3].valueForKey("startPage") as? String
            
            self.label2.text = self.dataParse[0].valueForKey("endPage") as? String
            self.label6.text = self.dataParse[1].valueForKey("endPage") as? String
            self.label10.text = self.dataParse[2].valueForKey("endPage") as? String
            self.label14.text = self.dataParse[3].valueForKey("endPage") as? String
            
            self.label3.text = self.dataParse[0].valueForKey("jumps") as? String
            self.label7.text = self.dataParse[1].valueForKey("jumps") as? String
            self.label11.text = self.dataParse[2].valueForKey("jumps") as? String
            self.label15.text = self.dataParse[3].valueForKey("jumps") as? String
            
            self.label4.text = self.dataParse[0].valueForKey("initials") as? String
            self.label8.text = self.dataParse[1].valueForKey("initials") as? String
            self.label12.text = self.dataParse[2].valueForKey("initials") as? String
            self.label16.text = self.dataParse[3].valueForKey("initials") as? String
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}