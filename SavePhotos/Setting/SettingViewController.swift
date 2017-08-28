//
//  SettingViewController.swift
//  SavePhotos
//
//  Created by ちゅーたつ on 2017/08/27.
//  Copyright © 2017年 ちゅーたつ. All rights reserved.
//

import UIKit
import Eureka

class SettingViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orange
        form
            +++ Section("アルバム")
            <<< TextRow("TextFiled"){
                $0.title = "テキスト入力"
                $0.placeholder = "ここに書いてね"
            }
            <<< ButtonRow() {
                
                $0.title = "プライバシーポリシー"
                $0.cell.accessoryType = .none
                }.cellSetup() {cell, row in
                    cell.backgroundColor = UIColor.red
                    cell.tintColor = UIColor.red
            }
            
            <<< ButtonRow() {
                
                $0.title = "パスワードを変更"
                $0.cell.accessoryType = .checkmark
            }
            
            <<< ButtonRow() {
                
                $0.title = "Touch Id をオンにする"
                $0.cell.accessoryType = .none
           }
            +++ Section("日記")

            <<< ButtonRow() {
                
                $0.title = "表示形式"
                $0.cell.accessoryType = .none
        }
        

        
           
            

        

        

        
        
        

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



// MARK: - StoryboardInstantiable

extension SettingViewController: StoryboardInstantiable {
    
    static var storyboardName: String {
        
        return String(describing: self)
    }
}
