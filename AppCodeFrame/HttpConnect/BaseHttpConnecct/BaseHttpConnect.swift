//
//  BaseHttpConnecct.swift
//  AppCodeFrame
//
//  Created by Jayden Zhao on 11/7/14.
//  Copyright (c) 2014 jayden. All rights reserved.
//

import Alamofire

class BaseHttpConnect :HttpConnectProtocol{
    var scheme:HttpScheme!
    var host:String!
    var requestPath:String!
    var resquestHeads:Dictionary<String,String>?
    var requestBody:Dictionary<String,AnyObject>?
    var responsBody:AnyObject?
    var resquestMethod:Alamofire.Method?
    var encoding:Alamofire.ParameterEncoding!
    var timeOut:NSTimeInterval = 30.0
    var errCode:Int = 0
    var delegate:HttpConnectDelegate?
    
    var request: Alamofire.Request!  {
        return self.setRequestByURLRequestConvertible(self.wrapRequest()).progress{ (bytesSentOrReceived, totalBytesSentOrReceived, totalBytesExpectedToSendOrReceived) in
            if let observer = self.delegate {
                observer.httpConnectResponse(self, bytesSentOrReceived: bytesSentOrReceived, totalBytesSentOrReceived: totalBytesSentOrReceived, totalBytesExpectedToSendOrReceived: totalBytesExpectedToSendOrReceived)
            }
        }
    }
    
    init(scheme:HttpScheme = .HTTP, host:String,  requestPath:String,  resquestMethod:Alamofire.Method? = .GET,  encoding:Alamofire.ParameterEncoding = .URL){
        self.scheme=scheme
        self.host=host
        self.requestPath=requestPath
        self.resquestMethod=resquestMethod;
        self.encoding=encoding
    }
    
    private  func wrapRequest()->Alamofire.URLRequestConvertible{
        var muRequest:NSMutableURLRequest = NSMutableURLRequest(URL: NSURL(scheme: self.scheme.rawValue, host: self.host, path: self.requestPath)!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: self.timeOut)
        
        if let method = self.resquestMethod {
            muRequest.HTTPMethod=method.rawValue
        }
        
        if let heads = self.resquestHeads{
            for item in heads {
                muRequest.setValue(item.1, forHTTPHeaderField: item.0)
            }
        }
        
        if let observer = self.delegate {
            observer.httpConnectWillRequest(self)
        }
        
        var convertRequest:NSURLRequest=muRequest;
        (convertRequest, _) = self.encoding.encode(convertRequest, parameters: self.requestBody)
        
        return convertRequest
    }
    
    func setRequestByURLRequestConvertible(requestConver:Alamofire.URLRequestConvertible)->Alamofire.Request{
        return Alamofire.request(requestConver)
    }
    
    func send() -> Alamofire.Request{
        return  self.request.response {(_, response, anyObject, error) in
            if let er = error {
                self.errCode=er.code
                if let observer = self.delegate {
                    observer.didHttpConnectError(er.code)
                }
                return
            }
            if let res = response {
                if let observer = self.delegate {
                    observer.didGetHttpConnectResponseHeads(res.allHeaderFields)
                }
            }else{
                return
            }
            self.handleResponse(response,anyObject: anyObject)
        }
    }
    
    func handleResponse(response:NSHTTPURLResponse?,anyObject:AnyObject?){
            self.responsBody=anyObject
            if let observer = self.delegate {
                observer.didHttpConnectFinish(self)
            }
    }
    
    func cancel(){
        self.request.cancel()
    }
}
