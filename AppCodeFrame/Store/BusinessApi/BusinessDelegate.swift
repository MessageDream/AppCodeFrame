//
//  BusinessDelegate.swift
//  AppCodeFrame
//
//  Created by jayden on 15/4/29.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

protocol BusinessDelegate:class{
    func didBusinessSuccessWithModel(model:BaseModel?)
    func didBusinessFail(fail:BusinessError)
    func didBusinessError(error:BusinessError)
}