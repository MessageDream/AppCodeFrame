//
//  HttpConnectDelegate.swift
//  AppCodeFrame
//
//  Created by Jayden Zhao on 11/14/14.
//  Copyright (c) 2014 jayden. All rights reserved.
//

import Foundation

protocol HttpConnectDelegate{   
    func willHttpConnectRequest(httpContent:HttpConnectProtocol)
    func didGetHttpConnectResponseHead(allHead:Dictionary<NSObject,AnyObject>)
    func httpConnectResponse(httpContent:HttpConnectProtocol,bytesSentOrReceived:Int64, totalBytesSentOrReceived:Int64, totalBytesExpectedToSendOrReceived:Int64)
    func didHttpConnectError(errorCode:Int)
    func didHttpConnectFinish(httpContent:HttpConnectProtocol)
}