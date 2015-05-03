//
//  BaseBuinessChannel.swift
//  AppCodeFrame
//
//  Created by Jayden Zhao on 11/20/14.
//  Copyright (c) 2014 jayden. All rights reserved.
//

import Foundation
import Alamofire

enum BusinessErrorType:Int{
    case REQUEST_NOERROR = 0
}

class BaseBusiness:BusinessProtocol,HttpConnectDelegate {
    var businessDelegate:BusinessDelegate?
    var httpConnect: HttpConnectProtocol?
    var businessError:BusinessError?
    
    private var _resultModel:BaseModel?
    var resultModel:BaseModel?{
        return _resultModel
    }
    
    init(){
    }
    
    func execute(param:Dictionary<String,AnyObject>?){
        if let par = param{//可能有无参数的情况
            if !NSJSONSerialization.isValidJSONObject(par) {
                return
            }
        }
        
        self.httpConnect?.delegate = self
        self.httpConnect?.sendWithParam(param)
    }

    func cancel(){
        self.httpConnect?.cancel()
    }
    
    func parseModelFromDic(responseBodyDic:Dictionary<String,AnyObject>) -> BaseModel? {
        return nil
    }
    
    func handleBusinessError(){
        self.businessDelegate?.didBusinessError(self.businessError!)
    }

    func errorCodeFromResponse(theResponseBody:Dictionary<String,AnyObject>){
    
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
        let errcode =  HttpErrorCode.fromValue(errorCode)
        self.businessError = BusinessError(errorCode:errcode.rawValue,errorMsg:errcode.description)
        self.businessDelegate?.didBusinessFail(self.businessError!)
    }
    
    func didHttpConnectFinish(httpContent:HttpConnectProtocol){
        if let bodyDic = httpContent.responsBody as? Dictionary<String,AnyObject>{
            self.errorCodeFromResponse(bodyDic)
            if let error = self.businessError{
                self.handleBusinessError()
                return
            }
            _resultModel = self.parseModelFromDic(bodyDic)
            self.businessDelegate?.didBusinessSuccessWithModel(_resultModel)
        }
    }
}
