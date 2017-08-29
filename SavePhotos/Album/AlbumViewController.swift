//
//  AlbumViewController.swift
//  SavePhotos
//
//  Created by ちゅーたつ on 2017/08/27.
//  Copyright © 2017年 ちゅーたつ. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController {
    

    var creatingAlbumName = ""
    
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
    
    open func reloadData(){
       self.collectionView.reloadData()
    }
    
    @IBAction func hoge(_ sender: Any) {
        createNewAlbum()

    }
    

    private func createNewAlbum(){
        let alert:UIAlertController = UIAlertController(title:"新規アルバム",
                                                        message: "",
                                                        preferredStyle: UIAlertControllerStyle.alert)
        
        let cancelAction:UIAlertAction = UIAlertAction(title: "キャンセル",
                                                       style: UIAlertActionStyle.cancel,
                                                       handler:nil)
        
        let defaultAction:UIAlertAction = UIAlertAction(title: "作成",style: .default,handler:{
                                                            (action:UIAlertAction!) -> Void in
                                                            let title = alert.textFields?[0].text!
                                                            self.creatingAlbumName = title!
                                                            self.showImagePicker()
                                                            
        })
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        
        //textfiledの追加
        alert.addTextField(configurationHandler: {(textField:UITextField!) -> Void in
            textField.text = "新規アルバム"
        })

        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    private func showImagePicker(){
            let picker = ImagePickerViewController.instantiateFromStoryboard()
            picker.type = .album
            present(picker, animated: true, completion: nil)
    }
    
    
}


// MARK: - UICollectionViewDataSource

extension AlbumViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Helper.albumdatas.count
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

