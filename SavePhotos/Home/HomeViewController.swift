//
//  HomeViewController.swift
//  SavePhotos
//
//  Created by ちゅーたつ on 2017/08/27.
//  Copyright © 2017年 ちゅーたつ. All rights reserved.
//

import UIKit


// MARK: - TabBarController

class HomeViewController: UITabBarController {
    
    
    // MARK: UITabBarController
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        
//        let topPageViewController = UINavigationController(rootViewController: HomeViewController())
//        topPageViewController.tabBarItem = UITabBarItem(title: "ホーム", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
//        
//        let _storeViewController = StoreViewController()
//        _storeViewController.title = "ストア"
//        let storeViewController = UINavigationController(rootViewController: _storeViewController)
//        storeViewController.tabBarItem = UITabBarItem(title: "ストア", image: UIImage(named: "book-multiple"), selectedImage: UIImage(named: "book-multiple"))
//        
//        let comicShelfViewController = UINavigationController(rootViewController: ComicShelfViewController.instantiateFromStoryboard())
//        comicShelfViewController.title = "本棚"
//        comicShelfViewController.tabBarItem = UITabBarItem(title: "本棚", image: UIImage(named: "view-list"), selectedImage: UIImage(named: "view-list"))
//        
//        let mypageViewController = UINavigationController(rootViewController: MypageViewController())
//        mypageViewController.title = "マイページ"
//        mypageViewController.tabBarItem = UITabBarItem(title: "マイページ", image: UIImage(named: "account"), selectedImage: UIImage(named: "account"))
        
        
        let albumViewController = AlbumViewController.instantiateFromStoryboard()
        albumViewController.tabBarItem = UITabBarItem(title: "アルバム", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        

        let postViewController = PostViewController.instantiateFromStoryboard()
        postViewController.tabBarItem = UITabBarItem(title: "ダイアリー", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        
        
        let settingViewController = SettingViewController.instantiateFromStoryboard()
        //SettingViewController.title = "設定"
        settingViewController.tabBarItem = UITabBarItem(title: "設定", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        
        self.setViewControllers([albumViewController, postViewController, settingViewController], animated: false)

    }
    
}

// MARK: - StoryboardInstantiable

//extension HomeController: StoryboardInstantiable {
//    
//    static var storyboardName: String {
//        
//        return String(describing: self)
//    }
//}
