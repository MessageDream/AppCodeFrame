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
    var businessDelegate:BusinessDelegate?{get set}
    var businessErrorType: BusinessErrorType{get}
    var httpConnect: HttpConnectProtocol?{get}
    var businessError:BusinessError?{get}
    
    func execute(param:Dictionary<String,AnyObject>?)
    
    func cancel()
}
