//
//  PostViewController.swift
//  SavePhotos
//
//  Created by ちゅーたつ on 2017/08/27.
//  Copyright © 2017年 ちゅーたつ. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    
    enum dialyDisplayType {
        case normal
        case oneline
    }
    
    var type:dialyDisplayType = .oneline
    
    fileprivate var diaries:[Dialy] {
        return Helper.dataManager.albums
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyan
        
        Helper.dataManager.loadSampleData()
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    open func reloadData(){
         self.tableView.reloadData()
    }
    
    @IBOutlet private weak var tableView: UITableView! {
    
        didSet{
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.register(DiaryTableViewCell.self)
        }
    }
    
    
}


// MARK: - UITableViewDataSource

extension PostViewController: UITableViewDataSource {
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        
//        return self.diaries.count
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.diaries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch self.type {
            
        case .normal:
            return UITableViewCell()
            
        case .oneline:
            let cell: DiaryTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.diary = self.diaries[indexPath.row]
            return cell
            
        }
    }
}


// MARK: - UITableViewDelegate

extension PostViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch self.type {
        case .normal:
            return UIScreen.main.bounds.height - 50
        case.oneline:
            return 100
        }
     
    }
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}


// MARK: - StoryboardInstantiable

extension PostViewController: StoryboardInstantiable {
    
    static var storyboardName: String {
        
        return String(describing: self)
    }
}
