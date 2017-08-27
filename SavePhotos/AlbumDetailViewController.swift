//
//  AlbumDetailViewController.swift
//  SavePhotos
//
//  Created by ちゅーたつ on 2017/08/27.
//  Copyright © 2017年 ちゅーたつ. All rights reserved.
//

import UIKit

class AlbumDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func hoge(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBOutlet private dynamic weak var collectionView: UICollectionView! {
        
        didSet {
            
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            self.collectionView.register(AlbumCollectionViewCell.self)
        }
    }
    
    
}


// MARK: - UICollectionViewDataSource

extension AlbumDetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: AlbumCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        //cell.comic = self.category?.comics[indexPath.item]
        return cell
    }
}


// MARK: - UICollectionViewDelegateFlowLayout

extension AlbumDetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (UIScreen.main.bounds.width - 20 ) / 3
        return CGSize(width: size, height: size)
        
    }
}


// MARK: - UICollectionViewDelegate

extension AlbumDetailViewController: UICollectionViewDelegate {
    //クリックイベント
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
}




// MARK: - StoryboardInstantiable

extension AlbumDetailViewController: StoryboardInstantiable {
    
    static var storyboardName: String {
        
        return String(describing: self)
    }
}

