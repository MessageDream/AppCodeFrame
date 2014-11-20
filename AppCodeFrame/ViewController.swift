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
        var fileDo : FileHttpConnect = FileHttpConnect(host:"localhost:3000", requestPath:"/server.crt")
        fileDo.send()
    }
    
    @IBOutlet weak var btn: UIButton!
}
