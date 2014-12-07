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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var counterInt:Int = Int(finalCounter) + 1
        var counterString:String = String(format: "%d", counterInt)
        counterLabel.text = counterString
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

