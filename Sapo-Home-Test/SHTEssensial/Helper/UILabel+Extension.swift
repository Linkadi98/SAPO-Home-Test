//
//  UILabel+Extension.swift
//  Sapo-Home-Test
//
//  Created by Minh Pham on 12/26/19.
//  Copyright © 2019 Sapo. All rights reserved.
//

import UIKit

extension UILabel {
    
    func setAttributedString(first: String, second: String) {
        
        let mutableAttributedString = NSMutableAttributedString()
        let boldAttribute = [ NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 23),
                              NSAttributedString.Key.foregroundColor: UIColor.darkGray
        ]
        
        let regularAttribute = [ NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 23),
                                 NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        
        let boldAttributedString = NSAttributedString(string: first, attributes: boldAttribute)
        let regularAttributedString = NSAttributedString(string: second, attributes: regularAttribute)
        mutableAttributedString.append(boldAttributedString)
        mutableAttributedString.append(regularAttributedString)
        
        attributedText = mutableAttributedString
        createUnderlineLabel()
    }
}
