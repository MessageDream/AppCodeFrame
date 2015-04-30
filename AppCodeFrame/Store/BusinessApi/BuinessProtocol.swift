//
//  BuinessChannelProtocol.swift
//  AppCodeFrame
//
//  Created by Jayden Zhao on 11/20/14.
//  Copyright (c) 2014 jayden. All rights reserved.
//

struct BusinessError:Printable {
    var errorCode: Int
    var errorMsg: String
    var description:String{
        return self.errorMsg
    }
}

protocol BuinessProtocol{
    typealias Element
    var businessDelegate:BusinessDelegate?{get set}
    var httpConnect: Element?{get}
    var businessError:BusinessError?{get}
    var resultModel:BaseModel?{get}
    func execute(param:Dictionary<String,AnyObject>?)
    
    func cancel()
}
