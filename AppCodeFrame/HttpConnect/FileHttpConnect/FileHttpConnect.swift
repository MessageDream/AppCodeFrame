//
//  FileHttpConnect.swift
//  AppCodeFrame
//
//  Created by Jayden Zhao on 11/14/14.
//  Copyright (c) 2014 jayden. All rights reserved.
//
import Alamofire

enum FileOperation:Int{
    case Upload = 0
    case Download = 1
}

class FileHttpConnect: BaseHttpConnect {
    var fileOperation:FileOperation!
    var uploadFileName:NSURL?
    var searchPathDirectory: NSSearchPathDirectory = .DocumentDirectory
    var searchPathDomain: NSSearchPathDomainMask = .UserDomainMask
    
//    /* *
//        以下两个指定构造器是为了隐藏父类的“全部参数”的指定构造器。
//    */
//    private init(scheme:HttpScheme, host:String, requestPath:String){
//        super.init(scheme:scheme,host:host,requestPath:requestPath)
//    }
//    
//    private init(host:String, requestPath:String){
//        super.init(host:host,requestPath:requestPath)
//    }
    
     init(scheme:HttpScheme, host:String, requestPath:String,uploadFileName:NSURL? = nil, fileOperation:FileOperation = .Download){
        if fileOperation == .Download{
            super.init(scheme:scheme,host:host,requestPath:requestPath)
        }else{
            super.init(scheme:scheme,host:host,requestPath:requestPath)
        }
        self.uploadFileName=uploadFileName
        self.fileOperation = fileOperation
    }
    
    
     init(host:String, requestPath:String,uploadFileName:NSURL? = nil,fileOperation:FileOperation = .Download){
        if fileOperation == .Download{
            super.init(host:host,requestPath:requestPath)
        }else{
            super.init(host:host,requestPath:requestPath)
        }
        self.uploadFileName=uploadFileName
        self.fileOperation = fileOperation
    }
    
    
    override func setRequestByURLRequestConvertible(requestConver:Alamofire.URLRequestConvertible)->Alamofire.Request{
        if self.fileOperation == .Download {
            return Alamofire.download(requestConver,Alamofire.Request.suggestedDownloadDestination(directory: searchPathDirectory, domain: searchPathDomain))
        }
        return Alamofire.upload(requestConver, uploadFileName!)
    }
    
    override func send(){
        self.request.progress{ (bytesSentOrReceived, totalBytesSentOrReceived, totalBytesExpectedToSendOrReceived) in
            if let observer = self.delegate {
                observer.httpConnectResponse(self, bytesSentOrReceived: bytesSentOrReceived, totalBytesSentOrReceived: totalBytesSentOrReceived, totalBytesExpectedToSendOrReceived: totalBytesExpectedToSendOrReceived)
            }
        }.response {
            (_, response, anyObject, error) in
            if let er = error {
                if let observer = self.delegate {
                    observer.didHttpConnectError(er.code)
                }
                return
            }
            if let res = response {
                if let observer = self.delegate {
                    observer.didGetHttpConnectResponseHead(res.allHeaderFields)
                }
            }
            
            if let an: AnyObject = anyObject {
                NSLog("\(an)")
            }
        }
    }
}
