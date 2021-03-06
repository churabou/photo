//
//  Ex_UITableView.swift
//  SavePhotos
//
//  Created by ちゅーたつ on 2017/08/28.
//  Copyright © 2017年 ちゅーたつ. All rights reserved.
//

import UIKit

// MARK: - Reuse Extension

extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) where T: Reusable {
        
        self.register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func register<T: UITableViewCell>(_: T.Type) where T: Reusable, T: NibLoadable {
        
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        self.register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: Reusable {
        
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        
        return cell
    }
}
