//
//  DistrictsViewController.swift
//  Sapo-Home-Test
//
//  Created by Minh Pham on 12/26/19.
//  Copyright © 2019 Sapo. All rights reserved.
//

import UIKit

class DistrictsViewController: UIViewController {

    @IBOutlet weak var districtsCollectionView: UICollectionView!
    
    var dataSource = DistrictsCollectionViewDataSoucre()
    
    var viewModel: DistrictViewModel?
    
    var selectedDistrict: District?
    override func viewDidLoad() {
        super.viewDidLoad()
        districtsCollectionView.configCollectionView()
        districtsCollectionView.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(sendData), name: .didFinish, object: nil)
    }
    
    
    @objc func sendData() {
        NotificationCenter.default.post(name: .didSelectDistrict, object: nil, userInfo: ["district": selectedDistrict?.name ?? ""])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if viewModel?.response?.value.districts?.isEmpty ?? true {
            fetchAndFilterDistricts(with: viewModel?.cityCode)
        }
    }
    
    func configViewModel(_ viewModel: DistrictViewModel) {
        self.viewModel = viewModel
        
        self.viewModel?.response?.bindAndFire { cities in
            self.viewModel?.dataSource?.data = Observable(cities)
        }
        self.viewModel?.dataSource?.data?.bind { cities in
            DispatchQueue.main.async {
                self.districtsCollectionView.dataSource = self.viewModel?.dataSource
                self.districtsCollectionView.reloadData()
            }
        }
    }

    func fetchAndFilterDistricts(with cityCode: Int?) {
        viewModel?.fetchData(completion: { districts in
            guard let districts = districts, let cityCode = cityCode else {
                return
            }
            
            let districtsAfterFiltering = districts.districts?.filter { $0.cityCode == cityCode }
            self.viewModel?.dataSource?.data?.value = Districts(districts: districtsAfterFiltering)
        })
    }
}


extension DistrictsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.deselectAllItems()
        UserDefaults.standard.set(collectionView.indexPathsForSelectedItems?.first?.row, forKey: "selectedDistrictRow")
        selectedDistrict = viewModel?.dataSource?.data?.value.districts?[indexPath.row]
        collectionView.cellForItem(at: indexPath)?.backgroundColor = .lightGray
        performSegue(withIdentifier: "genderSegue",
                     sender: selectedDistrict)
    }
    
    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?) {
        if segue.identifier == "genderSegue" {
            
        }
    }
}
