//
//  DialyTableViewCell.swift
//  SavePhotos
//
//  Created by ちゅーたつ on 2017/08/28.
//  Copyright © 2017年 ちゅーたつ. All rights reserved.
//

import UIKit

class DialyTableViewCell: UITableViewCell, Reusable {
    
    
    var dialy:Dialy! {
        
        didSet{
            
            print("hello wordl")
            self.textLabel?.text = dialy.title

        }
        
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
