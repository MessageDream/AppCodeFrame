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
    var fileOperation:FileOperation! = .Download
    var uploadFileName:NSURL?
    var uploadData: NSData?
    var searchPathDirectory: NSSearchPathDirectory = .DocumentDirectory
    var searchPathDomain: NSSearchPathDomainMask = .UserDomainMask
    lazy private var downloadFileDestination:Alamofire.Request.DownloadFileDestination = { [unowned self] (temporaryURL, response) -> (NSURL) in
        if let directoryURL = NSFileManager.defaultManager().URLsForDirectory(self.searchPathDirectory, inDomains: self.searchPathDomain)[0] as? NSURL {
            return directoryURL.URLByAppendingPathComponent(response.suggestedFilename!)
        }
        return temporaryURL
    }
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
    
     init(scheme:HttpScheme, host:String, requestPath:String,uploadFileName:NSURL? = nil,uploadData:NSData? = nil){
        super.init(scheme:scheme,host:host,requestPath:requestPath)
        self.uploadFileName=uploadFileName
        self.uploadData=uploadData
        if uploadFileName != nil || uploadData != nil{
            self.fileOperation = .Upload
        }
    }
    
    
     init(host:String, requestPath:String,uploadFileName:NSURL? = nil,uploadData:NSData? = nil){
        super.init(host:host,requestPath:requestPath)
        self.uploadFileName=uploadFileName
        self.uploadData=uploadData
         if uploadFileName != nil || uploadData != nil{
            self.fileOperation = .Upload
        }
    }

     required init(scheme: HttpScheme, host: String, requestPath: String, resquestMethod: Alamofire.Method?, encoding: Alamofire.ParameterEncoding) {
         super.init(scheme: scheme, host: host, requestPath: requestPath, resquestMethod: resquestMethod, encoding: encoding)
     }

     required init() {
         super.init()
     }
    
    override func setRequestByURLRequestConvertible(requestConver:Alamofire.URLRequestConvertible)->Alamofire.Request{
        if self.fileOperation == .Download {
            return Alamofire.download(requestConver,self.downloadFileDestination)
        }
        if let file = self.uploadFileName {
            return  Alamofire.upload(requestConver, file)
        }  else if let data = self.uploadData {
            return Alamofire.upload(requestConver, data)
        }
        return super.setRequestByURLRequestConvertible(requestConver)
    }
    
    override func parseHttpConnectResponseData(response: NSHTTPURLResponse?, anyObject: AnyObject?) -> AnyObject? {
         return self.downloadFileDestination(NSURL(),response!)
    }
}
