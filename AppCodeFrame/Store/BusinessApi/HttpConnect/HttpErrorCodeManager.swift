//
//  HttpErrorCodeManager.swift
//  AppCodeFrame
//
//  Created by jayden on 15/4/30.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

import Foundation

class HttpErrorCodeManager {
    class func getDesFromErrorCode(code:HttpErrorCode) -> String{
        switch code {
        case .HttpErrorCode_TimerOut:
            return  NSLocalizedString("HttpError2", comment:"")
        case .HttpErrorCode_WriteFileFail:
            return  NSLocalizedString("HttpError3", comment:"")
        case .HttpErrorCode_NetworkFail:
           return  NSLocalizedString("HttpError4", comment:"")
        default:
           return  NSLocalizedString("HttpError1", comment:"")
        }
    }
}
