//
//  Helper.swift
//  SavePhotos
//
//  Created by ちゅーたつ on 2017/08/28.
//  Copyright © 2017年 ちゅーたつ. All rights reserved.
//

import UIKit
import Photos

class Helper {
    
    static var AssetsInCameraRoll:[PHAsset] = []

    //新規アルバムを作成するとき、入力されたアルバムの名前を保持したい。
    static var creatingAlbumName = ""
    
    static var albumdatas:[Album] = []
    
    static let dataManager:DataManager = DataManager()
    
}


class DataManager {
    
    var albums:[Dialy] = []
    
    func loadSampleData(){
        addDiary()
        addDiary()


    }
    
    func addDiary(){
        let d = Dialy()
        d.title = "test"
        let image = UIImage(named:"chura1")!
        d.images.append(image)
        d.images.append(image)
        self.albums.append(d)
    }

}
