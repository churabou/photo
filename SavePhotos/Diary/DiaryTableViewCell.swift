//
//  DiaryTableViewCell.swift
//  SavePhotos
//
//  Created by ちゅーたつ on 2017/09/05.
//  Copyright © 2017年 ちゅーたつ. All rights reserved.
//

import UIKit


class DiaryTableViewCell: UITableViewCell, Reusable, NibLoadable{
    
    var diary:Dialy?{
        
        didSet{
            self.thumbnailView.image = self.diary?.images.first
        }
    }
    
    

    @IBOutlet weak private var thumbnailView: UIImageView!
    

    
}
