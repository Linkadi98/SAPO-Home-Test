//
//  NotificationCenter+Extension.swift
//  Sapo-Home-Test
//
//  Created by Minh Pham on 12/26/19.
//  Copyright © 2019 Sapo. All rights reserved.
//

import Foundation

extension Notification.Name {
    
    static let didSelectCity = Notification.Name(rawValue: "didSelectCity")
    
    static let didSelectDistrict = Notification.Name(rawValue: "didSelectDistrict")
    
    static let didSelectGender = Notification.Name(rawValue: "didSelectGender")
    
    static let didSelectAge = Notification.Name(rawValue: "didSelectAge")
    
    static let didFinish = Notification.Name(rawValue: "didFinish")
    
    static let didSelectUserName = Notification.Name(rawValue: "didSelectUserName")
    
    static let didSelectEmail = Notification.Name(rawValue: "didSelectEmail")
}
