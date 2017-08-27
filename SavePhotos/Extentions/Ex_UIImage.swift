//
//  Ex_UIImage.swift
//  SavePhotos
//
//  Created by ちゅーたつ on 2017/08/27.
//  Copyright © 2017年 ちゅーたつ. All rights reserved.
//

import UIKit

extension UIImage {
    
    func cropThumbnailImage(w:Int, h:Int) ->UIImage
    {
        // リサイズ処理
        let origRef    = self.cgImage
        let origWidth  = Int(origRef!.width)
        let origHeight = Int(origRef!.height)
        var resizeWidth:Int = 0, resizeHeight:Int = 0
        
        if (origWidth < origHeight) {
            resizeWidth = w
            resizeHeight = origHeight * resizeWidth / origWidth
        } else {
            resizeHeight = h
            resizeWidth = origWidth * resizeHeight / origHeight
        }
        
        let resizeSize = CGSize.init(width: CGFloat(resizeWidth), height: CGFloat(resizeHeight))
        
        UIGraphicsBeginImageContext(resizeSize)
        
        self.draw(in: CGRect.init(x: 0, y: 0, width: CGFloat(resizeWidth), height: CGFloat(resizeHeight)))
        
        let resizeImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // 切り抜き処理
        
        let cropRect  = CGRect.init(x: CGFloat((resizeWidth - w) / 2), y: CGFloat((resizeHeight - h) / 2), width: CGFloat(w), height: CGFloat(h))
        let cropRef   = resizeImage!.cgImage!.cropping(to: cropRect)
        let cropImage = UIImage(cgImage: cropRef!)
        
        return cropImage
    }
}
