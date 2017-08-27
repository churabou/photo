//
//  ImageCollectionView.swift
//  SavePhotos
//
//  Created by ちゅーたつ on 2017/08/27.
//  Copyright © 2017年 ちゅーたつ. All rights reserved.
//


import UIKit

class ImageCollectionViewCell: UICollectionViewCell, Reusable, NibLoadable {
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    //@IBOutlet private dynamic weak var imageView: UIImageView!
    
}
