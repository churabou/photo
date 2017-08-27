
//
//  BBB.swift
//  SavePhotos
//
//  Created by ちゅーたつ on 2017/06/11.
//  Copyright © 2017年 ちゅーたつ. All rights reserved.
//

import UIKit

class BBB: UIViewController {
    
    var _parent:PageManager!
    
    @IBAction func toM(_ sender: UIButton) {
        _parent.appendVC(_parent.main)
    }
    
    
    @IBAction func toA(_ sender: UIButton){
        _parent.appendVC(_parent.aaa)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _parent = self.parent as! PageManager
       
    }
    

}
