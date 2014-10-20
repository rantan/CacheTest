//
//  SessionDelegate.swift
//  CacheTest
//
//  Created by rantan on 2014/10/20.
//  Copyright (c) 2014年 jp.co.haw. All rights reserved.
//

import Foundation

class SessionDelegate: NSObject, NSURLSessionDelegate, NSURLSessionTaskDelegate, NSURLSessionDataDelegate {
    
    func URLSession(session: NSURLSession!, dataTask: NSURLSessionDataTask!, didReceiveResponse response: NSURLResponse!, completionHandler: (disposition :NSURLSessionResponseDisposition) -> Void) {
        println("didReceiveResponse")
        // ヘッダーを受信した後の処理を書く
       completionHandler(disposition: NSURLSessionResponseDisposition.Allow)
        
    }


    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, willCacheResponse proposedResponse: NSCachedURLResponse, completionHandler: (NSCachedURLResponse!) -> Void) {
        println("willcacheresponse")
        completionHandler(proposedResponse)
    }
    
    /*func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveResponse response: NSURLResponse, completionHandler: (NSURLSessionResponseDisposition) -> Void) {
        println("didReceiveResponse")
    }*/
    
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didBecomeDownloadTask downloadTask: NSURLSessionDownloadTask) {
        println("didBecomeDownloadTask")
    }
    
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData) {
        //println("didReceiveData")
    }
    
    func URLSession(session: NSURLSession, didBecomeInvalidWithError error: NSError?) {
        println("didBecomeInvalidWithError")
    }
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        println("didCompleteWithError")
        println(task.response?.description)
        //println(error?.description)
    }
    
}