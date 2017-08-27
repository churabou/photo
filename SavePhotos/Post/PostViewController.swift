//
//  PostViewController.swift
//  SavePhotos
//
//  Created by ちゅーたつ on 2017/08/27.
//  Copyright © 2017年 ちゅーたつ. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyan
        
        let v = InstaView.instantiateFromNib()
        self.view.addSubview(v)
        print(v.bounds)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// MARK: - StoryboardInstantiable

extension PostViewController: StoryboardInstantiable {
    
    static var storyboardName: String {
        
        return String(describing: self)
    }
}
