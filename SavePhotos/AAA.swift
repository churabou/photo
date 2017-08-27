//
//  AAA.swift
//  SavePhotos
//
//  Created by ちゅーたつ on 2017/06/11.
//  Copyright © 2017年 ちゅーたつ. All rights reserved.
//

import UIKit

class AAA: UIViewController {
    
    
    
    var _parent:PageManager!
    
    @IBAction func toM(_ sender: UIButton) {
        _parent.appendVC(_parent.main)
    }
    
    @IBAction func toB(_ sender: UIButton){
        _parent.appendVC(_parent.bbb)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _parent = self.parent as! PageManager
        // Do any additional setup after loading the view.
    }
    
    
}
