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
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        webView.bounds = screenSize
        
        // Random Button for Wikipedia
        var randomURL = "http://en.wikipedia.org/wiki/Special:Random"
        var url = NSURL(string: randomURL)
        var request = NSURLRequest(URL: url!)
        
        self.webView.scalesPageToFit = false;
        
        webView.loadRequest(request)
        
        textLabel.text = "hello, world"
    
        //var text = request.
        //textField.text = text
    }

}

