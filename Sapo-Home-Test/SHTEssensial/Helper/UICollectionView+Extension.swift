//
//  UICollectionView+Extension.swift
//  Sapo-Home-Test
//
//  Created by Minh Pham on 12/26/19.
//  Copyright © 2019 Sapo. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func configCollectionView() {
        let width = UIScreen.main.bounds.width
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: width - 20, height: 60)
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        collectionViewLayout = layout
    }
}

extension UICollectionView {
    func deselectAllItems(animated: Bool = false) {
        let selectedRow = UserDefaults.standard.integer(forKey: "selectedRow")
        for indexPath in self.indexPathsForSelectedItems ?? [] {
            if indexPath.row == selectedRow {
                continue
            }
            cellForItem(at: indexPath)?.backgroundColor = .white
        }
    }
}
