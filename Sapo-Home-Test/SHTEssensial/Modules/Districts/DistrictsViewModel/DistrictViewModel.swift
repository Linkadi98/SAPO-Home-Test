//
//  DistrictViewModel.swift
//  Sapo-Home-Test
//
//  Created by Minh Pham on 12/26/19.
//  Copyright © 2019 Sapo. All rights reserved.
//

import Foundation

struct DistrictViewModel: GenericViewModel {
    typealias T = Districts
    
    var response: Observable<Districts>?
    var cityCode: Int?
    var dataSource: DistrictsCollectionViewDataSoucre?
    
    func fetchData(completion: @escaping (Districts?) -> Void) {
        
        APIManager.instance.getData(type: Districts.self, urlString: "https://raw.githubusercontent.com/sapo-tech/home_test_mobile/master/Districts.json", completion: { response in
            guard let response = response else {
                return
            }
            completion(response)
        })
    }
}
