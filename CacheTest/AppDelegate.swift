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

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // キャッシュ領域のサイズ調整
        //let URLCache = NSURLCache(memoryCapacity: 10*1024*1024, diskCapacity: 5000*1024*1024, diskPath: "big.urlcache")
        //NSURLCache.setSharedURLCache(URLCache)
        
        
        return true
    }

    // NSURLSessionDelegateを使わないパターン
    func testCacheNoDelegate() {
        let cachePolicy: NSURLRequestCachePolicy = .UseProtocolCachePolicy
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        config.requestCachePolicy = cachePolicy
        config.URLCache = NSURLCache.sharedURLCache()
        
        let session = NSURLSession(configuration: config, delegate: nil, delegateQueue: NSOperationQueue.mainQueue())
        
        let url = NSURL(string: "http://localhost:4567/cache")
        let request = NSMutableURLRequest(URL: url)
        
        request.cachePolicy = cachePolicy
        request.HTTPMethod = "GET"
        
        // cacheされたデータがあるか
        println(NSURLCache.sharedURLCache().cachedResponseForRequest(request)?.description)
        
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            println(NSString(data: data, encoding: NSUTF8StringEncoding))
            println(response.description)
        })
        task.resume()
    }
    
    func testCacheDelegate() {
        let cachePolicy: NSURLRequestCachePolicy = .UseProtocolCachePolicy
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        config.requestCachePolicy = cachePolicy
        config.URLCache = NSURLCache.sharedURLCache()
        
        let delegate = SessionDelegate()
        let session = NSURLSession(configuration: config, delegate: delegate, delegateQueue: NSOperationQueue.mainQueue())
        
        let url = NSURL(string: "http://localhost:4567/cache")
        let request = NSMutableURLRequest(URL: url)
        
        request.cachePolicy = cachePolicy
        request.HTTPMethod = "GET"
        
        // cacheされたデータがあるか
        println(NSURLCache.sharedURLCache().cachedResponseForRequest(request)?.description)
        
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

