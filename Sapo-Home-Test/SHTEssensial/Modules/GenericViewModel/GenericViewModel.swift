//
//  GenericViewModel.swift
//  Sapo-Home-Test
//
//  Created by Minh Pham on 12/26/19.
//  Copyright © 2019 Sapo. All rights reserved.
//

import Foundation

protocol GenericViewModel {
    associatedtype T
    
    var response: Observable<T>? { get set}
    
    func fetchData(completion: @escaping (T?) -> Void)
}
