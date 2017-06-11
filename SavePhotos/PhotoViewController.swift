//
//  PickViewController.swift
//  SavePhotos
//
//  Created by ちゅーたつ on 2017/06/07.
//  Copyright © 2017年 ちゅーたつ. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    
    
    @IBOutlet weak var imageView: UIImageView!

    
    @IBOutlet weak var label: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "chura1")!
        label.text = "hoge"
        

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
