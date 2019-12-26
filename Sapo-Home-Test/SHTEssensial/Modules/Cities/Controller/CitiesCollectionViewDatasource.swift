//
//  CitiesCollectionViewDatasource.swift
//  Sapo-Home-Test
//
//  Created by Minh Pham on 12/25/19.
//  Copyright © 2019 Sapo. All rights reserved.
//

import UIKit

class CitiesCollectionViewDatasource: GenericCollectionViewDataSource<Cities>, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.value.cities?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SHTPlaceCell
        
        guard let cityName = data?.value.cities?[indexPath.row].name else {
            return cell
        }
        cell.setName(with: cityName)
        let selectedRow = UserDefaults.standard.string(forKey: "selectedCityRow") ?? ""
        if indexPath.row == Int(selectedRow) {
            cell.backgroundColor = .lightGray
        }
        else {
            cell.backgroundColor = .white
        }
        
        return cell
    }
}
