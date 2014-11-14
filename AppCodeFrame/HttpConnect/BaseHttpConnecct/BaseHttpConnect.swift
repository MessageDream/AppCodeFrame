//
//  BaseHttpConnecct.swift
//  AppCodeFrame
//
//  Created by Jayden Zhao on 11/7/14.
//  Copyright (c) 2014 jayden. All rights reserved.
//

import Alamofire

class BaseHttpConnect :HttpConnectProtocol{
    var scheme:String!
    var host:String!
    var requestPath:String!
    var resquestHeads:Dictionary<String,String>?
    var requestBody:Dictionary<String,AnyObject>?
    var resquestMethod:Alamofire.Method?
    var encoding:Alamofire.ParameterEncoding!
    var timeOut:NSTimeInterval = 30.0
    var errCode:Int = 0
    
    var request: Alamofire.Request!  {
        return self.setRequestByURLRequestConvertible(self.wrapRequest())
    }
    
    init(scheme:String = "http", host:String,  requestPath:String,  resquestMethod:Alamofire.Method? = .GET,  encoding:Alamofire.ParameterEncoding = .URL){
        self.scheme=scheme
        self.host=host
        self.requestPath=requestPath
        self.resquestMethod=resquestMethod;
        self.encoding=encoding
    }
    
    private  func wrapRequest()->Alamofire.URLRequestConvertible{
        var muRequest:NSMutableURLRequest = NSMutableURLRequest(URL: NSURL(scheme: self.scheme, host: self.host, path: self.requestPath)!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: self.timeOut)
        
        if let method = self.resquestMethod {
            muRequest.HTTPMethod=method.rawValue
        }
        
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
        
    }
    
    func cancel(){
        self.request.cancel()
    }
}
