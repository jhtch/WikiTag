//
//  ViewControllerTwo.swift
//  WikiTag
//
//  Created by James Hotchkiss on 11/26/14.
//  Copyright (c) 2014 James Hotchkiss. All rights reserved.
//

import UIKit

class ViewControllerTwo: UIViewController {
    
    
    @IBOutlet var destinationWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var randomURL = "http://en.wikipedia.org/wiki/Special:Random"
        var url = NSURL(string: randomURL)
        var destinationRequest = NSURLRequest(URL: url!)
        destinationWebView.loadRequest(destinationRequest)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

