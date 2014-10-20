//
//  AppDelegate.swift
//  CacheTest
//
//  Created by rantan on 2014/10/17.
//  Copyright (c) 2014年 jp.co.haw. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, NSURLSessionDelegate, NSURLSessionTaskDelegate, NSURLSessionDataDelegate {

    var window: UIWindow?
    
    var session: NSURLSession!
    
    let cachePolicy: NSURLRequestCachePolicy = .UseProtocolCachePolicy


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        /*
        let URLCache = NSURLCache(memoryCapacity: 100*1024*1024, diskCapacity: 100*1024*1024, diskPath: nil)
        NSURLCache.setSharedURLCache(URLCache)
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        let url = NSURL(string: "https://clients5.google.com/pagead/drt/dn/dn.js")
        
        let request = NSMutableURLRequest(URL: url)
        URLCache.cachedResponseForRequest(request)
        
        let task = session.dataTaskWithURL(url) {
            (data, response, error) in
            println("fuga")
            let cachedResponse = URLCache.cachedResponseForRequest(request)
            sleep(10)
            println("sleeped")
            println(cachedResponse?.description)
            //println("hoge")
        }
        
        task.resume()
        */
        
        //let URLCache = NSURLCache(memoryCapacity: 10*1024*1024, diskCapacity: 5000*1024*1024, diskPath: "big.urlcache")
        //NSURLCache.setSharedURLCache(URLCache)
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        //config.requestCachePolicy = .ReturnCacheDataDontLoad
        config.requestCachePolicy = cachePolicy
        config.URLCache = NSURLCache.sharedURLCache()
        let delegate = SessionDelegate()
        session = NSURLSession(configuration: config, delegate: delegate, delegateQueue: NSOperationQueue.mainQueue())
        
        testCache()
        testCache()
        testCache()
        
        return true
    }
    
    /*
    func testCache() {
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        config.requestCachePolicy = .UseProtocolCachePolicy
        
        let cache = NSURLCache(memoryCapacity: 10*1024*1024, diskCapacity: 5000*1024*1024, diskPath: "big.urlcache")
        config.URLCache = cache
        
        let queue: dispatch_queue_t = dispatch_queue_create("com.domain.app.datatasks", nil)

        let session = NSURLSession(configuration: config, delegate: self, delegateQueue: nil)
        
        for i in 1...40 {
            let semaphore: dispatch_semaphore_t = dispatch_semaphore_create(0)
            
            dispatch_sync(queue, {
                let request = NSURLRequest(URL: NSURL(string: "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.6/angular.min.js"))
                let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
                    if error != nil {
                        println("error: \(error)")
                    } else {
                        println("done: \(i)")
                    }
                    
                    dispatch_semaphore_signal(semaphore)
                })
                
                task.resume()
                
                dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
            })
        }
        
        dispatch_async(queue, {
            println("usage:\(cache.currentMemoryUsage)")
            println("usage:\(cache.currentDiskUsage)")
            
            let delayInSeconds: Double = 10.0
            let popTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(delayInSeconds * Double(NSEC_PER_SEC)))
            dispatch_after(popTime, dispatch_get_main_queue(), {
                println("usage:\(cache.currentMemoryUsage)")
                println("usage:\(cache.currentDiskUsage)")
                let response = cache.cachedResponseForRequest(NSURLRequest(URL: NSURL(string: "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.6/angular.min.js")))
                println(response?.description)
            })
        })
        
    }
*/
    
    func testCache() {
        let url = NSURL(string: "http://localhost:4567/cache")
        let request = NSMutableURLRequest(URL: url)
        
        //request.cachePolicy = .ReturnCacheDataDontLoad
        request.cachePolicy = cachePolicy
        
        request.HTTPMethod = "GET"
        let task = session.dataTaskWithRequest(request)
        task.resume()
    }
    
    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

