//
//  BaseCollectionView.swift
//  Sapo-Home-Test
//
//  Created by Minh Pham on 12/25/19.
//  Copyright © 2019 Sapo. All rights reserved.
//

import UIKit

class GenericCollectionViewDataSource<T>: NSObject {
    var data: Observable<T>?
    
    var reuseIdentifier: String {
        return "SHTPlaceCell"
    }
}
