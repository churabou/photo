//
//  WriteViewController.swift
//  SavePhotos
//
//  Created by ちゅーたつ on 2017/08/28.
//  Copyright © 2017年 ちゅーたつ. All rights reserved.
//

import UIKit
import Photos

class WriteViewController: UIViewController {

    
    var assets:[PHAsset] = [] {
        didSet {
           self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet{
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            self.collectionView.register(ImageCollectionViewCell.self)
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.showImagePickerView))
            self.collectionView.addGestureRecognizer(tapGesture)
        }
    }
    
    
    
    
    @IBAction func onClickCancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func post(_ sender: Any) {
        let present = self.presentingViewController as! HomeViewController
        let PostVC = present.viewControllers?[1] as! PostViewController
        Helper.dataManager.addDiary()
        
        dismiss(animated: true, completion: {
          PostVC.reloadData()
        })
    }

    
    
    func showImagePickerView(){
        let picker = ImagePickerViewController.instantiateFromStoryboard()
        picker.type = .diary
        self.present(picker, animated: true, completion: nil)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



// MARK: - UICollectionViewDataSource

extension WriteViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return self.assets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: ImageCollectionViewCell  = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.asset = self.assets[indexPath.row]
        return cell
    }
}


// MARK: - UICollectionViewDelegateFlowLayout

extension WriteViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (UIScreen.main.bounds.width - 30 ) / 4
        return CGSize(width: size, height: size)
        
    }
}


// MARK: - UICollectionViewDelegate

extension WriteViewController: UICollectionViewDelegate {
    //クリックイベント
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        //self.collectionView
    }
}






