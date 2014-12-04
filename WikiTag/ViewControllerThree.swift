//
//  ViewControllerThree.swift
//  WikiTag
//
//  Created by James Hotchkiss on 11/26/14.
//  Copyright (c) 2014 James Hotchkiss. All rights reserved.
//

import UIKit

class ViewControllerThree: UIViewController {
    
    
    @IBOutlet var currentWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var randomURL = "http://en.wikipedia.org/wiki/Special:Random"
        var url = NSURL(string: randomURL)
        var currentRequest = NSURLRequest(URL: url!)
        currentWebView.loadRequest(currentRequest)
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}