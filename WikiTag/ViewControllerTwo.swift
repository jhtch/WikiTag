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
    
    @IBOutlet weak var newPage: UIButton!
    
    var urlString = NSURL(string: "http://google.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var randomURL = "http://en.wikipedia.org/wiki/Special:Random"
        var url = NSURL(string: randomURL)
        var destinationRequest = NSURLRequest(URL: url!)
        destinationWebView.loadRequest(destinationRequest)
        
        urlString = url;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   @IBAction func didClickNewPage(sender: AnyObject) {
        
        var randomURL = "http://en.wikipedia.org/wiki/Special:Random"
        var url = NSURL(string: randomURL)
        var destinationRequest = NSURLRequest(URL: url!)
        destinationWebView.loadRequest(destinationRequest)
    
        urlString = url;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue.identifier == "segueOne") {
            
            var svc = segue!.destinationViewController as ViewControllerThree;
            
            svc.toPass = urlString;
            
        }
    }
}

