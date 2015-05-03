//
//  UserLoginBusiness.swift
//  AppCodeFrame
//
//  Created by Jayden Zhao on 15/4/30.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

class UserLoginBusiness:BaseBusiness {
    override init() {
        super.init()
        self.httpConnect = JsonHttpConnect(host: "", requestPath: "", resquestMethod: .GET)
    }
}
