//
//  JsonHttpConnect.swift
//  AppCodeFrame
//
//  Created by jayden on 15/4/29.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

import Alamofire

class JsonHttpConnect: BaseHttpConnect {
    
    private func createBaseBussinessHeads(){
        if let head = self.resquestHeads{
            self.resquestHeads?[HTTPHeadContentType] = HTTPContentType.Json.rawValue
        }else{
            self.resquestHeads = [HTTPHeadContentType:HTTPContentType.Json.rawValue]
        }
    }
    
    override func parseHttpConnectResponseData(response: NSHTTPURLResponse?, anyObject: AnyObject?) -> AnyObject? {
        return anyObject
    }
    
    override func sendWithParam(param: Dictionary<String, AnyObject>?) -> Request {
        self .createBaseBussinessHeads()
        return super.sendWithParam(param)
    }
}
