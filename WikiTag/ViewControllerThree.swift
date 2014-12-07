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
    
    // initialize the counter
    var counter = 0.0
    
    @IBOutlet var pageLabel: UILabel!
    
    var toPass: NSURL!
    var toPassTwo: NSURL!
    
    var curURLStr: String!
    var toPassStr: String!
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view
        super.viewDidLoad()
        
        // load a random wikipedia page
        var randomURL = "http://en.wikipedia.org/wiki/Special:Random"
        var url = NSURL(string: randomURL)
        var currentRequest = NSURLRequest(URL: url!)
        currentWebView.loadRequest(currentRequest)
        currentWebView.delegate = self
        
        // take the title of the wiki page and convert to plain text
        var endStr = toPass.lastPathComponent
        pageLabel.text = endStr!.stringByReplacingOccurrencesOfString("_", withString: " ",options: NSStringCompareOptions.LiteralSearch,range: nil)
    }
    
    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
        super.didReceiveMemoryWarning()
    }
    
    //
    func webViewDidStartLoad(currentWebView: UIWebView!) {
        var curURL = self.currentWebView.request?.URL
        curURLStr = curURL?.absoluteString
        toPassStr = toPass?.absoluteString
    }
    
    // increment counter and check if the destination has been reached
    func webViewDidFinishLoad(currentWebView: UIWebView!) {
        counter += 0.5
        var counterInt:Int = Int(counter)
        var counterString:String = String(format: "%d", counterInt)
        myLabel.text = counterString
        
        var curURL = self.currentWebView.request?.URL
        
        // set the startURL variable to be passed as the current URL
        if (toPassTwo == nil)
        {
            toPassTwo = curURL
        }
        // if the page is the destination, then we have won!
        
        if (curURLStr.hasPrefix(toPassStr))
        {
            self.performSegueWithIdentifier("segueTwo", sender: self)
        }
    }
    
    // implement back button
    @IBAction func backPage(sender: AnyObject) {
        if (currentWebView.canGoBack)
        {
            currentWebView.goBack()
        }
    }
    
    
    // pass values and segue
    override func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject!) {
        if (segue.identifier == "segueTwo") {
            
            let theDestination = (segue.destinationViewController as ViewControllerFour)
            theDestination.finalCounter = counter
            
            theDestination.startPageURL = toPassTwo
            theDestination.endPageURL = toPass
        }
    }
}
