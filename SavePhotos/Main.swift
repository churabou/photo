//
//  Main.swift
//  SavePhotos
//
//  Created by ちゅーたつ on 2017/06/11.
//  Copyright © 2017年 ちゅーたつ. All rights reserved.
//

import UIKit

class Main: UIViewController {

    

    var _parent:PageManager!
    
    //viewAに移動
    @IBAction func toA(_ sender: UIButton) {
        _parent.appendVC(_parent.aaa)
    }
    
    
    //viewBに移動
    @IBAction func toB(_ sender: UIButton) {
        _parent.appendVC(_parent.bbb)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _parent = self.parent as! PageManager

    }

}
