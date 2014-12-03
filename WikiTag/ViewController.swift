//
//  ViewController.swift
//  WikiTag
//
//  Created by James Hotchkiss on 11/26/14.
//  Copyright (c) 2014 James Hotchkiss. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet var webView:UIWebView!
    @IBOutlet var webViewDummy:UIWebView!
   
    @IBOutlet var textLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didClickGo(AnyObject) {
        
        //let screenSize: CGRect = UIScreen.mainScreen().bounds
        //webView.bounds = screenSize
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        webView.bounds = screenSize
        self.webView.scalesPageToFit = true;

        
        // Random Button for Wikipedia
        var randomURL = "http://en.wikipedia.org/wiki/Special:Random"
        var url = NSURL(string: randomURL)
        var request = NSURLRequest(URL: url!)
        
        // second random button
        var secondrandomURL = "http://en.wikipedia.org/wiki/Special:Random"
        var secondurl = NSURL(string: secondrandomURL)
        var secondrequest = NSURLRequest(URL: secondurl!)
        
        // load the webpage
        webView.loadRequest(request)
        webViewDummy.loadRequest(secondrequest)
        
        // get current URL from request
        var curURL = self.webView.request?.URL
        var destURL = self.webViewDummy.request?.URL
        
        // set the label text to the current URL (which isn't loaded onto page until Go is hit again)
        textLabel.text = destURL?.absoluteString

    }

}

