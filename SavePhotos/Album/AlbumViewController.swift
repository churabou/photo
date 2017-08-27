//
//  AlbumViewController.swift
//  SavePhotos
//
//  Created by ちゅーたつ on 2017/08/27.
//  Copyright © 2017年 ちゅーたつ. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //ナビゲーションバーを非表示にする。
        self.navigationController?.setNavigationBarHidden(true, animated: false)    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBOutlet private dynamic weak var collectionView: UICollectionView! {
        didSet{
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            self.collectionView.register(AlbumCollectionViewCell.self)
        }
    }
    
    @IBAction func hoge(_ sender: Any) {
        
        let picker = ImagePickerViewController.instantiateFromStoryboard()
        present(picker, animated: true, completion: nil)
    }
    
    
    
}


// MARK: - UICollectionViewDataSource

extension AlbumViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: AlbumCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        //cell.comic = self.category?.comics[indexPath.item]
        return cell
    }
}


// MARK: - UICollectionViewDelegateFlowLayout

extension AlbumViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (UIScreen.main.bounds.width - 10 ) / 2
        return CGSize(width: size, height: size)
        
    }
}


// MARK: - UICollectionViewDelegate

extension AlbumViewController: UICollectionViewDelegate {
    //クリックイベント
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let albumDetail = AlbumDetailViewController.instantiateFromStoryboard()
        self.navigationController?.pushViewController(albumDetail, animated: true)
        //self.present(albumDetail, animated: true, completion: nil) //modal
    }
}





// MARK: - StoryboardInstantiable

extension AlbumViewController: StoryboardInstantiable {
    
    static var storyboardName: String {
        
        return String(describing: self)
    }
}

