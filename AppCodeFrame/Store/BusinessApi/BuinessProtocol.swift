//
//  BuinessChannelProtocol.swift
//  AppCodeFrame
//
//  Created by Jayden Zhao on 11/20/14.
//  Copyright (c) 2014 jayden. All rights reserved.
//

struct BusinessError {
    var errorCode: Int
    var errorMsg: String
}

enum BusinessErrorType:Int{
    case REQUEST_NOERROR = 0
}

protocol BuinessProtocol{
    var businessId: Int?{get}
//  var businessObserver:BusinessProtocl?
    var businessErrorType: BusinessErrorType{get}
    var businessHttpConnect: HttpConnectProtocol?{get}
    var businessError:BusinessError?{get}
    
    func execute(param:Dictionary<String,AnyObject>?)
    
    //取消请求
    func cancel()
    
    //解析返回数据
    func parseBusinessHttpConnectResponseData()->Dictionary<String,AnyObject>?
    
    //获取错误码
    func errorCodeFromResponse(theResponseBody:AnyObject?)
}
