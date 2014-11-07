//
//  BaseHttpConnecct.swift
//  AppCodeFrame
//
//  Created by Jayden Zhao on 11/7/14.
//  Copyright (c) 2014 jayden. All rights reserved.
//

import Alamofire

class BaseHttpConnecct {
    var scheme:String! = "https"
    var baseUrl:String!
    var requestPath:String!
    var resquestHeads:Dictionary<String,String>?
    var requestBody:Dictionary<String,AnyObject>?
    var resquestMethod:Alamofire.Method!
    var encoding:Alamofire.ParameterEncoding! = .URL
    var timeOut:NSTimeInterval = 30.0
    var errCode:Int = 0
    
    var request: Alamofire.Request!  {
        return self.setRequestByURLRequestConvertible(self.wrapRequest())
    }
    
    private  func wrapRequest()->Alamofire.URLRequestConvertible{
        var muRequest:NSMutableURLRequest = NSMutableURLRequest(URL: NSURL(scheme: self.scheme, host: self.baseUrl, path: self.requestPath)!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: self.timeOut)
        
        muRequest.HTTPMethod=self.resquestMethod.rawValue
        
        if let heads = self.resquestHeads{
            for item in heads {
                muRequest.setValue(item.1, forHTTPHeaderField: item.0)
            }
        }
        
        var convertRequest:NSURLRequest=muRequest;
        (convertRequest, _) = self.encoding.encode(convertRequest, parameters: self.requestBody)
        return convertRequest
    }
    
    func setRequestByURLRequestConvertible(requestConver:Alamofire.URLRequestConvertible)->Alamofire.Request{
        return Alamofire.request(requestConver)
    }
    
    func send(){
      self.request.response { (<#NSURLRequest#>, <#NSHTTPURLResponse?#>, <#AnyObject?#>, <#NSError?#>) -> Void in
        <#code#>
        }
    }
    
    func cancel(){
        self.request.cancel()
    }
}
