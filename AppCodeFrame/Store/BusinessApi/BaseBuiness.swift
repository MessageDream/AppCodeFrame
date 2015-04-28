//
//  BaseBuinessChannel.swift
//  AppCodeFrame
//
//  Created by Jayden Zhao on 11/20/14.
//  Copyright (c) 2014 jayden. All rights reserved.
//

import Foundation

class BaseBuiness:BuinessProtocol,HttpConnectDelegate {
    
    var businessId: Int?
    //  var businessObserver:BusinessProtocl?
    var businessErrorType: BusinessErrorType = .REQUEST_NOERROR
    var businessHttpConnect: HttpConnectProtocol?
    var businessError:BusinessError?
    
    func execute(param:Dictionary<String,AnyObject>?){
    
    }

    func cancel(){
    
    }
    
    func parseBusinessHttpConnectResponseData()->Dictionary<String,AnyObject>?{
        return nil
    }

    func errorCodeFromResponse(theResponseBody:AnyObject?){
    
    }
    
    /**
    =================HttpConnectDelegate==================
    */
    func httpConnectWillRequest(httpContent:HttpConnectProtocol){
    
    }
    
    func didGetHttpConnectResponseHeads(allHeads:Dictionary<NSObject,AnyObject>){
    
    }
    
    func httpConnectResponse(httpContent:HttpConnectProtocol,bytesSentOrReceived:Int64, totalBytesSentOrReceived:Int64, totalBytesExpectedToSendOrReceived:Int64){
    
    }
    
    func didHttpConnectError(errorCode:Int){
    
    }
    
    func didHttpConnectFinish(httpContent:HttpConnectProtocol){
    
    }
}
