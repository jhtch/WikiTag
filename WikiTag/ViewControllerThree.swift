//
//  ViewControllerThree.swift
//  WikiTag yay
//
//  Created by James Hotchkiss on 11/26/14.
//  Copyright (c) 2014 James Hotchkiss. All rights reserved.
//

import UIKit

class ViewControllerThree: UIViewController, UIWebViewDelegate {

    @IBOutlet var myLabel: UILabel!
    @IBOutlet var currentWebView: UIWebView!
    var counter = 0.0
    
    var toPass: NSURL!
    var toPassTwo: NSURL!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        var randomURL = "http://en.wikipedia.org/wiki/Special:Random"
        var url = NSURL(string: randomURL)
        var currentRequest = NSURLRequest(URL: url!)
        currentWebView.loadRequest(currentRequest)
        currentWebView.delegate = self
        
        var curURL = self.currentWebView.request?.URL
        toPassTwo = curURL

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidFinishLoad(currentWebView: UIWebView!) {
        var currentURL = currentWebView.request?.URL.absoluteString
        counter += 0.5
        var counterInt:Int = Int(counter)
        var counterString:String = String(format: "%d", counterInt)
        myLabel.text = counterString
        
        var curURL = self.currentWebView.request?.URL
        if (curURL == toPass)
        {
            self.performSegueWithIdentifier("segueTwo", sender: self)
        }
        
    }
    
    @IBAction func backPage(sender: AnyObject) {
        if (currentWebView.canGoBack)
        {
            currentWebView.goBack()
        }
    }
    
    override func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject!) {
        if (segue.identifier == "segueTwo") {
            let theDestination = (segue.destinationViewController as ViewControllerFour)
            theDestination.finalCounter = counter
            
            theDestination.startPageURL = toPassTwo
            theDestination.endPageURL = toPass
        }
    }
}
