//
//  ImagePickerViewController.swift
//  SavePhotos
//
//  Created by ちゅーたつ on 2017/08/27.
//  Copyright © 2017年 ちゅーたつ. All rights reserved.
//

import UIKit
import Photos

class ImagePickerViewController: UIViewController {
    
    
    enum PickerOrigin{
        case album
        case diary
    }
    
    var type:PickerOrigin?
    
    fileprivate var AssetsInCamerRoll:[PHAsset] {
        return Helper.AssetsInCameraRoll
    }
    
    private var photoAssets:[PHAsset] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if AssetsInCamerRoll.isEmpty{
            libraryRequestAuthorization()
        }
       // self.collectionView.reloadData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet private dynamic weak var collectionView: UICollectionView! {
        
        didSet{
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            self.collectionView.allowsMultipleSelection = true
            self.collectionView.register(ImageCollectionViewCell.self)
        }
    }
    
    @IBAction func a(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func b(_ sender: UIButton) {
        
        let path = self.collectionView.indexPathsForSelectedItems
        var asset:[PHAsset] = []
        for i in path! {
            asset.append(AssetsInCamerRoll[i.row])
        }
        print(asset)
        if self.type == .diary {
            let writeView = self.presentingViewController as! WriteViewController
            dismiss(animated: true, completion: {
                writeView.assets = asset
            })
        
        }
        
    }
    
    
    
    // カメラロールへのアクセス許可
    fileprivate func libraryRequestAuthorization() {
        PHPhotoLibrary.requestAuthorization({ [weak self] status in
            guard let wself = self else {
                return
            }
            switch status {
            case .authorized:
                wself.getAllPhotosInfo()
            case .denied:
                wself.showDeniedAlert()
            case .notDetermined:
                print("NotDetermined")
            case .restricted:
                print("Restricted")
            }
        })
    }
    
    // カメラロールから全て取得する
    fileprivate func getAllPhotosInfo() {
        let assets: PHFetchResult = PHAsset.fetchAssets(with: .image, options: nil)
        assets.enumerateObjects({ [weak self] (asset, index, stop) -> Void in
            guard let wself = self else {
                return
            }
            wself.photoAssets.append(asset as PHAsset)
        })
        Helper.AssetsInCameraRoll = photoAssets
        collectionView.reloadData()
    }
    
    // カメラロールへのアクセスが拒否されている場合のアラート
    fileprivate func showDeniedAlert() {
        let alert: UIAlertController = UIAlertController(title: "エラー",
                                                         message: "「写真」へのアクセスが拒否されています。設定より変更してください。",
                                                         preferredStyle: .alert)
        let cancel: UIAlertAction = UIAlertAction(title: "キャンセル",
                                                  style: .cancel,
                                                  handler: nil)
        let ok: UIAlertAction = UIAlertAction(title: "設定画面へ",
                                              style: .default,
                                              handler: { [weak self] (action) -> Void in
                                                guard let wself = self else {
                                                    return
                                                }
                                                wself.transitionToSettingsApplition()
        })
        alert.addAction(cancel)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    fileprivate func transitionToSettingsApplition() {
        let url = URL(string: UIApplicationOpenSettingsURLString)
        if let url = url {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    

   
}



// MARK: - UICollectionViewDataSource

extension ImagePickerViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       // return 10
      return AssetsInCamerRoll.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: ImageCollectionViewCell  = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.asset = AssetsInCamerRoll[indexPath.row]
        //cell.imageView.image = UIImage(named: "chura0")
        return cell
    }
}


// MARK: - UICollectionViewDelegateFlowLayout

extension ImagePickerViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (UIScreen.main.bounds.width - 30 ) / 4
        return CGSize(width: size, height: size)
        
    }
}


// MARK: - UICollectionViewDelegate

extension ImagePickerViewController: UICollectionViewDelegate {
    //クリックイベント
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        //self.collectionView
    }
}




// MARK: - StoryboardInstantiable

extension ImagePickerViewController: StoryboardInstantiable {
    
    static var storyboardName: String {
        
        return String(describing: self)
    }
}


