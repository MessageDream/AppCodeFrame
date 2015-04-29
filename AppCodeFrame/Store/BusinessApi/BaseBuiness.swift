//
//  BaseBuinessChannel.swift
//  AppCodeFrame
//
//  Created by Jayden Zhao on 11/20/14.
//  Copyright (c) 2014 jayden. All rights reserved.
//

import Foundation

class BaseBuiness:BuinessProtocol,HttpConnectDelegate {
    
    var businessDelegate:BusinessDelegate?
    var businessErrorType: BusinessErrorType = .REQUEST_NOERROR
    var httpConnect: HttpConnectProtocol?
    var businessError:BusinessError?
    
    func execute(param:Dictionary<String,AnyObject>?){
    
    }

    func cancel(){
        if let conn = self.httpConnect{
            conn.cancel()
        }
    }
    
    func parseModelFromDic(responseBodyDic:Dictionary<String,AnyObject>?) -> BaseModel? {
        return nil;
    }
    
    func handleBusinessError(){
        if let delegate = self.businessDelegate {
           delegate.didBusinessErrorWithCode(self.businessError?.errorCode, andMsg: self.businessError?.errorMsg)
        }
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
//        _errCode = errorCode;
//        _errmsg = [HttpErrorCodeManager getDesFromErrorCode:errorCode];
//        if (self.businessDelegate && [self.businessDelegate respondsToSelector:@selector(didBusinessFailWithCode:andMsg:)]){
//            [self.businessDelegate didBusinessFailWithCode:_errCode andMsg:_errmsg];
//        }
    }
    
    func didHttpConnectFinish(httpContent:HttpConnectProtocol){
    
    }
}
