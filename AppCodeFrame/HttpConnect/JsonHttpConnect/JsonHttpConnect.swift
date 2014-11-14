//
//  JsonHttpConnect.swift
//  AppCodeFrame
//
//  Created by Jayden Zhao on 11/14/14.
//  Copyright (c) 2014 jayden. All rights reserved.
//

import Alamofire

class JsonHttpConnect: BaseHttpConnect {
    
    init(scheme:HttpScheme , host:String, requestPath:String, resquestMethod:Alamofire.Method = .GET){
        super.init(scheme:scheme,host:host,requestPath:requestPath, resquestMethod:resquestMethod,encoding:.JSON)
    }
    
    init(host:String, requestPath:String, resquestMethod:Alamofire.Method = .GET){
        super.init(host:host,requestPath:requestPath, resquestMethod:resquestMethod,encoding:.JSON)
    }
}
