//
//  LogUtil.swift
//  AppCodeFrame
//
//  Created by Jayden Zhao on 15/4/30.
//  Copyright (c) 2015年 jayden. All rights reserved.
//


class LogUtil {
    class func printLog<T>(message: T, file:String = __FILE__, method:String = __FUNCTION__, line:Int = __LINE__){
        #if DEBUG
            println("\(file.lastPathComponent)[\(line)], \(method): \(message)")
        #endif
    }
    
}
