//
//  ViewController.swift
//  CacheTest
//
//  Created by rantan on 2014/10/17.
//  Copyright (c) 2014年 jp.co.haw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var appDelegate: AppDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func delegateTap(sender: AnyObject) {
        self.appDelegate.testCacheDelegate()
    }

    @IBAction func tap(sender: AnyObject) {
        self.appDelegate.testCacheNoDelegate()
    }
}

