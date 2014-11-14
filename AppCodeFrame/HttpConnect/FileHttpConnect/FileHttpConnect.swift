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
    var fileName:NSURL?
    var searchPathDirectory: NSSearchPathDirectory = .DocumentDirectory
    var searchPathDomain: NSSearchPathDomainMask = .UserDomainMask
    
    /* *
        以下两个指定构造器是为了隐藏父类的“全部参数”的指定构造器。
    */
    init(scheme:String, host:String, requestPath:String){
        super.init(scheme:scheme,host:host,requestPath:requestPath)
    }
    
    init(host:String, requestPath:String){
        super.init(host:host,requestPath:requestPath)
    }
    
    convenience init(scheme:String, host:String, requestPath:String,fileName:NSURL, fileOperation:FileOperation = .Download){
        if fileOperation == .Download{
            self.init(scheme:scheme,host:host,requestPath:requestPath)
        }else{
            self.init(scheme:scheme,host:host,requestPath:requestPath)
        }
        self.fileName=fileName
        self.fileOperation = fileOperation
    }
    
    
    convenience init(host:String, requestPath:String,fileName:NSURL,fileOperation:FileOperation = .Download){
        if fileOperation == .Download{
            self.init(host:host,requestPath:requestPath)
        }else{
            self.init(host:host,requestPath:requestPath)
        }
        self.fileName=fileName
        self.fileOperation = fileOperation
    }
    
    override func setRequestByURLRequestConvertible(requestConver:Alamofire.URLRequestConvertible)->Alamofire.Request{
        if self.fileOperation == .Download {
            return Alamofire.download(requestConver,Alamofire.Request.suggestedDownloadDestination(directory: searchPathDirectory, domain: searchPathDomain))
        }
        return Alamofire.upload(requestConver, self.fileName!)
    }
}
