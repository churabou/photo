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

        
        let albumViewController = UINavigationController(rootViewController: AlbumViewController.instantiateFromStoryboard())
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
