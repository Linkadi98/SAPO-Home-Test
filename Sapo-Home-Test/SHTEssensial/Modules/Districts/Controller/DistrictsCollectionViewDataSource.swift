//
//  DistrictsCollectionViewDataSource.swift
//  Sapo-Home-Test
//
//  Created by Minh Pham on 12/25/19.
//  Copyright © 2019 Sapo. All rights reserved.
//

import UIKit

class DistrictsCollectionViewDataSoucre: GenericCollectionViewDataSource<Districts>, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.value.districts?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SHTPlaceCell
        
        guard let district = data?.value.districts?[indexPath.row] else {
            return cell
        }
        let selectedDistrictRow = UserDefaults.standard.string(forKey: "selectedDistrictRow") ?? ""
        if indexPath.row == Int(selectedDistrictRow) {
            cell.backgroundColor = .lightGray
        }
        else {
            cell.backgroundColor = .white
        }
        cell.setName(with: district.name)
        return cell
    }
    
    
}


