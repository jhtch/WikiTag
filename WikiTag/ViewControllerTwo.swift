//
//  ViewControllerTwo.swift
//  WikiTag
//
//  Created by James Hotchkiss on 11/26/14.
//  Copyright (c) 2014 James Hotchkiss. All rights reserved.
//

import UIKit

class ViewControllerTwo: UIViewController, UIWebViewDelegate {

    @IBOutlet var destinationWebView: UIWebView!
    
    @IBOutlet weak var newPage: UIButton!
    
    var urlPass: NSURL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var randomURL = "http://en.wikipedia.org/wiki/Special:Random"
        var url = NSURL(string: randomURL)
        var destinationRequest = NSURLRequest(URL: url!)
        destinationWebView.loadRequest(destinationRequest)
        
        destinationWebView.delegate = self
        
        
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

    }
    
    @IBAction func didClickJesus(sender: AnyObject) {
        
        var jesusURL = "http://en.wikipedia.org/wiki/Jesus"
        var url = NSURL(string: jesusURL)
        var destinationRequest = NSURLRequest(URL: url!)
        destinationWebView.loadRequest(destinationRequest)
    }
    
    func webViewDidFinishLoad(destinationWebView: UIWebView!) {
        
        var curURL = self.destinationWebView.request?.URL
        urlPass = curURL
    }
    
    override func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject!) {
        if (segue.identifier == "segueOne") {
            
            let theDestination = (segue.destinationViewController as ViewControllerThree)
            theDestination.toPass = urlPass
            
        }
    }
}

