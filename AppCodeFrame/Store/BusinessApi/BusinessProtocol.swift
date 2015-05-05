//
//  BuinessChannelProtocol.swift
//  AppCodeFrame
//
//  Created by Jayden Zhao on 11/20/14.
//  Copyright (c) 2014 jayden. All rights reserved.
//

import ReactiveCocoa

struct BusinessError:Printable {
    var errorCode: Int
    var errorMsg: String
    var description:String{
        return self.errorMsg
    }
}

protocol BusinessProtocol:class{
    weak var businessDelegate:BusinessDelegate?{get set}
    var httpConnect: HttpConnectProtocol?{get}
    var businessError:PropertyOf<BusinessError?>{get}
    var resultModel: PropertyOf<BaseModel?>{get}
    func execute(param:Dictionary<String,AnyObject>?)
    
    func cancel()
}
