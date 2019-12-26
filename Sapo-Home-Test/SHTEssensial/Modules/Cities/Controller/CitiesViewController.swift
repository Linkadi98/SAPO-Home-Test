//
//  CitiesViewController.swift
//  Sapo-Home-Test
//
//  Created by Minh Pham on 12/25/19.
//  Copyright © 2019 Sapo. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController {

    @IBOutlet weak var citiesCollectionView: UICollectionView!
    
    var viewModel: CitiesViewModel?
    let width = UIScreen.main.bounds.width
    var selectedCity: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewModel()
        citiesCollectionView.configCollectionView()
        citiesCollectionView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(sendData), name: .didFinish, object: nil)
    }
    
    @objc func sendData() {
        NotificationCenter.default.post(name: .didSelectCity, object: nil, userInfo: ["city": selectedCity?.name ?? ""])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if viewModel?.response?.value.cities?.isEmpty ?? true {
            fetchCities()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
//        citiesCollectionView.deselectAllItems()
    }
    
    func configViewModel() {
        viewModel = CitiesViewModel(response: Observable(Cities(cities: [])), dataSource: CitiesCollectionViewDatasource())
        viewModel?.response?.bindAndFire { cities in
            self.viewModel?.dataSource?.data = Observable(cities)
        }
        viewModel?.dataSource?.data?.bind { cities in
            DispatchQueue.main.async {
                self.citiesCollectionView.dataSource = self.viewModel?.dataSource
                self.citiesCollectionView.reloadData()
            }
            
        }
    }
    
    
    func fetchCities() {
        viewModel?.fetchData(completion: { cities in
            guard let cities = cities else {
                return
            }
            self.viewModel?.dataSource?.data?.value = cities
            
        })
    }
}

extension CitiesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: width - 20, height: 60)
    }
}

extension CitiesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectAllItems()
        UserDefaults.standard.set(collectionView.indexPathsForSelectedItems?.first?.row, forKey: "selectedCityRow")
        selectedCity = viewModel?.dataSource?.data?.value.cities?[indexPath.row]
        collectionView.cellForItem(at: indexPath)?.backgroundColor = .lightGray
        
        performSegue(withIdentifier: "districtSegue", sender: selectedCity)
    }
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "districtSegue", let cityCode = (sender as? City)?.cityCode {
            let vc = segue.destination as! DistrictsViewController
            vc.configViewModel( DistrictViewModel(response: Observable(Districts(districts: [])), cityCode: cityCode, dataSource: DistrictsCollectionViewDataSoucre()))
        }
    }
}
