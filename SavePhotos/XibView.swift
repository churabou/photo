//
//  XibView.swift
//  SavePhotos
//
//  Created by ちゅーたつ on 2017/08/17.
//  Copyright © 2017年 ちゅーたつ. All rights reserved.
//

import UIKit

class XibView : UIView, NibLoadable {

    @IBAction func tap(_ sender: UIButton) {
        
        sender.backgroundColor = sender.backgroundColor == UIColor.red ? UIColor.blue : UIColor.red
    }
     
}
