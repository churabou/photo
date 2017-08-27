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
        self.view.backgroundColor = UIColor.blue
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
         //ナビゲーションバーを非表示にする。
         self.navigationController?.setNavigationBarHidden(true, animated: false)    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var button: UIButton! {
    
        didSet{
            self.button.addTarget(self, action: #selector(self.hoge), for: .touchUpInside)
        }
        
    }
    
    func hoge(){
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

