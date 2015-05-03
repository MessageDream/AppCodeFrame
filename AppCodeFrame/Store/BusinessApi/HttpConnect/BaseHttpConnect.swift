//
//  BaseHttpConnecct.swift
//  AppCodeFrame
//
//  Created by Jayden Zhao on 11/7/14.
//  Copyright (c) 2014 jayden. All rights reserved.
//

import Alamofire

class BaseHttpConnect :HttpConnectProtocol{
    var scheme:HttpScheme = .HTTP
    var host:String!
    var requestPath:String!
    var resquestHeads:Dictionary<String,String>?
    var requestBody:Dictionary<String,AnyObject>?
    var responsBody:AnyObject?
    var resquestMethod:Alamofire.Method?
    var encoding:Alamofire.ParameterEncoding!
    var timeOut:NSTimeInterval = 30.0
    var errCode:Int = 0
    weak var delegate:HttpConnectDelegate?
    
    var request: Alamofire.Request!  {
        return self.setRequestByURLRequestConvertible(self.wrapRequest()).progress{ (bytesSentOrReceived, totalBytesSentOrReceived, totalBytesExpectedToSendOrReceived) in
            self.delegate?.httpConnectResponse(self, bytesSentOrReceived: bytesSentOrReceived, totalBytesSentOrReceived: totalBytesSentOrReceived, totalBytesExpectedToSendOrReceived: totalBytesExpectedToSendOrReceived)
        }
    }
    
    required init(){
        self.host = ""
        self.requestPath = ""
    }
    
     init(scheme:HttpScheme = .HTTP, host:String,  requestPath:String,  resquestMethod:Alamofire.Method? = .GET,  encoding:Alamofire.ParameterEncoding = .URL){
        self.scheme=scheme
        self.host=host
        self.requestPath=requestPath
        self.resquestMethod=resquestMethod
        self.encoding=encoding
    }
    
    private  func wrapRequest()->Alamofire.URLRequestConvertible{
        var muRequest:NSMutableURLRequest = NSMutableURLRequest(URL: NSURL(scheme: self.scheme.rawValue, host: self.host, path: self.requestPath)!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: self.timeOut)
        
        if let method = self.resquestMethod {
            muRequest.HTTPMethod=method.rawValue
        }

        self.delegate?.httpConnectWillRequest(self)
        
        if let heads = self.resquestHeads{
            for item in heads {
                muRequest.setValue(item.1, forHTTPHeaderField: item.0)
            }
        }
        
        var convertRequest:NSURLRequest=muRequest
        (convertRequest, _) = self.encoding.encode(convertRequest, parameters: self.requestBody)
        
        return convertRequest
    }
    
    func setRequestByURLRequestConvertible(requestConver:Alamofire.URLRequestConvertible)->Alamofire.Request{
        return Alamofire.request(requestConver)
    }
    
    func sendWithParam(param: Dictionary<String, AnyObject>?) -> Request {
        self.requestBody = param
        return self.send()
    }
    
    func send() -> Alamofire.Request{
        return  self.request.response {(_, response, anyObject, error) in
            if let er = error {
                self.errCode=er.code
                self.delegate?.didHttpConnectError(er.code)
                return
            }
            if let res = response {
                self.delegate?.didGetHttpConnectResponseHeads(res.allHeaderFields)
            }else{
                return
            }
           self.responsBody = self.parseHttpConnectResponseData(response,anyObject: anyObject)
           self.delegate?.didHttpConnectFinish(self)
        }
    }
    
    func parseHttpConnectResponseData(response:NSHTTPURLResponse?,anyObject:AnyObject?)->AnyObject?{
        return anyObject
    }
    
    func cancel(){
        self.request.cancel()
    }
}
