//
//  LogUtil.swift
//  AppCodeFrame
//
//  Created by Jayden Zhao on 11/20/14.
//  Copyright (c) 2014 jayden. All rights reserved.
//

import Foundation

class LogUtil{
    class  func log(format: String, args: CVarArgType...){
       NSLog(String(format: format,arguments: args))
    }
}