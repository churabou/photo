//
//  PageManager.swift
//  SavePhotos
//
//  Created by ちゅーたつ on 2017/06/11.
//  Copyright © 2017年 ちゅーたつ. All rights reserved.
//

//なんかちょっと違う fade in animationのオリジナル
import UIKit

class PageManager: UIViewController {
    
    
    var aaa:AAA!
    var bbb:BBB!
    var main:Main!
    var currentVC:UIViewController!

    
    
    func appendVC(_ vc:UIViewController){
        removeVC()

      
//        
        currentVC.view.alpha = 1
        UIView.animate(withDuration: 0.8, animations: {
            self.currentVC.view.alpha = 0
        }, completion:   nil)
    
        
        self.addChildViewController(vc)
        self.view.addSubview(vc.view)
        vc.view.alpha = 0
        UIView.animate(withDuration: 0.8, animations: {
            vc.view.alpha = 1
        }, completion:   {(f:Bool) in
            self.currentVC.view.removeFromSuperview()
            self.currentVC.removeFromParentViewController()
            self.currentVC = vc
        })
        
    }
    
    
    func removeVC(){
        currentVC.view.removeFromSuperview()
        currentVC.removeFromParentViewController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        aaa = storyboard?.instantiateViewController(withIdentifier: "viewAAA") as! AAA
        bbb = storyboard?.instantiateViewController(withIdentifier: "viewBBB") as! BBB
        main = storyboard?.instantiateViewController(withIdentifier: "viewMain") as! Main
        
        self.currentVC = aaa
        self.addChildViewController(aaa)
        self.view.addSubview(aaa.view)
        currentVC = aaa
        
        // Do any additional setup after loading the view.
    }

}
