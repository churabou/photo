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
    
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override var isSelected:Bool {
        didSet {
           self.label.isHidden = !isSelected
        }
    }
    
    var asset:PHAsset? {
        
        didSet {
            
            guard  let asset = self.asset else {
                return
            }
          //self.imageView.image = getAssetThumbnail(asset: asset).cropping()

          imageii(asset:asset)
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
    
    func imageii(asset:PHAsset){
        
        let manager: PHImageManager = PHImageManager()
        manager.requestImage(for: asset,
                             targetSize: CGSize(width:70, height:70),
                                     contentMode: .aspectFill,
                                     options: nil) { (image, info) -> Void in
                                        self.imageView.image = image
                                        // 取得したimageをUIImageViewなどで表示する
                                        print("index")
        }
    }
    //@IBOutlet private dynamic weak var imageView: UIImageView!
    
}
