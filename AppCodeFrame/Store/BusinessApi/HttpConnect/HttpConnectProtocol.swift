//
//  HttpConnecctProtocol.swift
//  AppCodeFrame
//
//  Created by Jayden Zhao on 11/14/14.
//  Copyright (c) 2014 jayden. All rights reserved.
//

import Alamofire

enum HttpScheme:String{
    case HTTP = "http"
    case HTTPS = "https"
}

let HTTPHeadContentType = "Content-Type"
enum HTTPContentType:String{
    case Json = "application/json;charset=utf-8"
    case MultipartForm = "multipart/form-data"
}

enum HttpErrorCode:Int{
    case HttpErrorCode_NetworkFail = -1004
    case HttpErrorCode_None = 200
    case HttpErrorCode_TimerOut = 10
    case HttpErrorCode_WriteFileFail
}

protocol HttpConnectProtocol {
    var scheme:HttpScheme!{get}
    var host:String!{get}
    var requestPath:String!{get}
    var resquestHeads:Dictionary<String,String>?{get set}
    var requestBody:Dictionary<String,AnyObject>?{get set}
    var responsBody:AnyObject?{get}
    var resquestMethod:Alamofire.Method?{get}
    var encoding:Alamofire.ParameterEncoding!{get}
    var timeOut:NSTimeInterval{get set}
    var errCode:Int{get set}
    
    var request: Alamofire.Request! {get}
    var delegate:protocol<HttpConnectDelegate>?{get set}
    
//    init(scheme:String, host:String,  requestPath:String,  resquestMethod:Alamofire.Method,  encoding:Alamofire.ParameterEncoding)
    
    func setRequestByURLRequestConvertible(requestConver:Alamofire.URLRequestConvertible)->Alamofire.Request
    func sendWithParam(param:Dictionary<String,AnyObject>?) -> Alamofire.Request
    func send() -> Alamofire.Request
    func cancel();
}
