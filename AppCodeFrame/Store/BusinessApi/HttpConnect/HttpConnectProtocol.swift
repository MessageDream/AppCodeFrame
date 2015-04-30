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

enum HttpErrorCode:Int,Printable{
    case HttpErrorCode_NetworkFail = -1004
    case HttpErrorCode_TimerOut = 10
    case HttpErrorCode_None = 200
    case HttpErrorCode_WriteFileFail
    
    var description:String{
        switch self {
        case .HttpErrorCode_TimerOut:
            return  NSLocalizedString("http_error_2", comment:"")
        case .HttpErrorCode_WriteFileFail:
            return  NSLocalizedString("http_error_3", comment:"")
        case .HttpErrorCode_NetworkFail:
            return  NSLocalizedString("http_error_4", comment:"")
        default:
            return  NSLocalizedString("http_error_1", comment:"")
        }
    }
    
    static func fromValue(num:Int) -> HttpErrorCode{
        switch num{
        case HttpErrorCode.HttpErrorCode_TimerOut.rawValue:
            return .HttpErrorCode_TimerOut
        case HttpErrorCode.HttpErrorCode_WriteFileFail.rawValue:
            return .HttpErrorCode_WriteFileFail
        case HttpErrorCode.HttpErrorCode_None.rawValue:
            return .HttpErrorCode_None
        default:
            return .HttpErrorCode_NetworkFail
        }
    }
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
    var delegate:HttpConnectDelegate?{set get}
    
    var request: Alamofire.Request! {get}
    
//    init(scheme:String, host:String,  requestPath:String,  resquestMethod:Alamofire.Method,  encoding:Alamofire.ParameterEncoding)
    
    func setRequestByURLRequestConvertible(requestConver:Alamofire.URLRequestConvertible)->Alamofire.Request
    func sendWithParam(param:Dictionary<String,AnyObject>?) -> Alamofire.Request
    func send() -> Alamofire.Request
    func cancel()
}
