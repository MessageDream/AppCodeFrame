//
//  BusinessRacProtocol.swift
//  AppCodeFrame
//
//  Created by Jayden Zhao on 15/4/30.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

import ReactiveCocoa

protocol BusinessRacProtocol:class{
    var rac_isActiveSignal: RACSignal{get}
}
