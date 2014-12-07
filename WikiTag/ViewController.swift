//
//  ViewController.swift
//  WikiTag
//
//  Created by James Hotchkiss on 11/26/14.
//  Copyright (c) 2014 James Hotchkiss. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    

    @IBOutlet var webView:UIWebView!
    @IBOutlet var webViewDummy:UIWebView!
   
    @IBOutlet var textLabel:UILabel!
    
    @IBOutlet weak var Counter: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var tracker = 0
    
    @IBAction func didClickGo(AnyObject) {
        
        //let screenSize: CGRect = UIScreen.mainScreen().bounds
        //webView.bounds = screenSize
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        webView.bounds = screenSize
        self.webView.scalesPageToFit = true;

        
        // Random Button for Wikipedia
        var randomURL = "http://en.wikipedia.org/wiki/Special:Random"
        var url1 = NSURL(string: randomURL)
        var request1 = NSURLRequest(URL: url1!)
        
        // load the webpage
        webView.loadRequest(request1)
        webViewDummy.loadRequest(request1)
        webView.delegate = self
        
        
        // get current URL from request
        var curURL = self.webView.request?.URL
        var destURL = self.webViewDummy.request?.URL
        
        // set the label text to the current URL (which isn't loaded onto page until Go is hit again)
        textLabel.text = destURL?.absoluteString
        }
    
    func webViewDidFinishLoad(webView: UIWebView!) {
        var currenturl = webView.request?.URL.absoluteString
        Counter.text = currenturl
    }
}

