//
//  ViewController.swift
//  AppCodeFrame
//
//  Created by Jayden Zhao on 11/14/14.
//  Copyright (c) 2014 jayden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func download_click(sender: AnyObject) {
        var fileDo : FileHttpConnect = FileHttpConnect(host:"image16-c.poco.cn", requestPath:"/mypoco/myphoto/20140913/19/4534609120140913190342037_640.jpg?1000x667_120",fileOperation:.Download)
        fileDo.send()
    }
    
    @IBOutlet weak var btn: UIButton!
}
