//
//  SHTCityCell.swift
//  Sapo-Home-Test
//
//  Created by Minh Pham on 12/25/19.
//  Copyright © 2019 Sapo. All rights reserved.
//

import UIKit

class SHTPlaceCell: UICollectionViewCell {
    
    @IBOutlet weak var name: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layer.cornerRadius = 10
        backgroundColor = .white
    }

    func setName(with name: String?) {
        guard let name = name else {
            self.name.text = "---"
            return
        }
        
        self.name.text = name
    }
}
