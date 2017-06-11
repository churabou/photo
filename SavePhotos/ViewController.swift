//
//  ViewController.swift
//  SavePhotos
//
//  Created by ちゅーたつ on 2017/06/07.
//  Copyright © 2017年 ちゅーたつ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setCV()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var scrollView:UIScrollView!
    var pageNum = 5
    
    func setCV(){
        self.scrollView = UIScrollView(frame: self.view.bounds)
        self.scrollView.contentSize = CGSize(width:self.view.bounds.width ,height: self.view.bounds.height * CGFloat(pageNum))
        //self.scrollView.isPagingEnabled = true
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.showsVerticalScrollIndicator = false
        //self.scrollView.delegate = self;
        self.view.addSubview(self.scrollView)
        
        
        for p in 1...pageNum {
            let frame = CGRect(x:0, y:self.view.bounds.height * CGFloat(p-1), width:self.view.bounds.width, height:self.view.bounds.height)
            print("hge")
            let page = storyboard?.instantiateViewController(withIdentifier: "asset") as! PhotoViewController
           // page.imageView.image = UIImage(named: "chura1")!
            //page.label.text = "天気良かったから"
            
            //管理クラスを仲介すれば書けなくもない
            let v = page.view!
            v.frame = frame
        
            self.scrollView.addSubview(v)
            
        }
    }
    
    func aa(_ text:String, image:UIImage){
        let page = (storyboard?.instantiateViewController(withIdentifier: "asset"))! as! PhotoViewController
        page.label.text = text
        page.imageView.image = image
        self.view.addSubview(page.view)
    
        
    }
    
    
    func reloadData(){
       
    }


}

