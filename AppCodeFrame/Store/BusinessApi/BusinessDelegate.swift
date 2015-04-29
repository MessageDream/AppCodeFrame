//
//  BusinessDelegate.swift
//  AppCodeFrame
//
//  Created by jayden on 15/4/29.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

protocol BusinessDelegate{
    func didBusinessSuccessWithModel(model:BaseModel)
    func didBusinessFailWithCode(code:Int?,andMsg msg:String?)
    func didBusinessErrorWithCode(code:Int?, andMsg msg:String?)
}