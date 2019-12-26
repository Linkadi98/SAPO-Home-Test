//
//  CitiesViewModel.swift
//  Sapo-Home-Test
//
//  Created by Minh Pham on 12/25/19.
//  Copyright © 2019 Sapo. All rights reserved.
//

import Foundation

struct CitiesViewModel: GenericViewModel {
    typealias T = Cities
    
    var response: Observable<Cities>?
    var dataSource: CitiesCollectionViewDatasource?
    
    func fetchData(completion: @escaping (Cities?) -> Void) {
        APIManager.instance.getData(type: Cities.self, urlString: "https://raw.githubusercontent.com/sapo-tech/home_test_mobile/master/Cities.json", completion: { cities in
            guard let cities = cities else {
                return
            }
            completion(cities)
        })
    }
}
