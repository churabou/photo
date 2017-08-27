//
//  ImageCollectionView.swift
//  SavePhotos
//
//  Created by ちゅーたつ on 2017/08/27.
//  Copyright © 2017年 ちゅーたつ. All rights reserved.
//


import UIKit
import Photos

class ImageCollectionViewCell: UICollectionViewCell, Reusable, NibLoadable {
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    var asset:PHAsset? {
        
        didSet {
            print("index")
            guard  let asset = self.asset else {
                return
            }
          self.imageView.image = getAssetThumbnail(asset: asset).cropThumbnailImage(w: 100, h: 100)
        }
    
    }
    

    
    //phasset -> uiimage
    func getAssetThumbnail(asset: PHAsset) -> UIImage {
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        option.isSynchronous = true
        manager.requestImage(for: asset, targetSize: frame.size, contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in
            thumbnail = result!
        })
        return thumbnail
    }
    
    //@IBOutlet private dynamic weak var imageView: UIImageView!
    
}
