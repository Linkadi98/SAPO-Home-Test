//
//  GeneralInfoViewController.swift
//  Sapo-Home-Test
//
//  Created by Minh Pham on 12/26/19.
//  Copyright © 2019 Sapo. All rights reserved.
//

import UIKit

class GeneralInfoViewController: UIViewController {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var Email: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var district: UILabel!
    
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = nextButton.frame.height / 2
        }
    }
    
    override func awakeFromNib() {
        let center = NotificationCenter.default
        print(1234354245)
        center.addObserver(self, selector: #selector(onGetUserData(_:)), name: .didSelectCity, object: nil)
        center.addObserver(self, selector: #selector(onGetUserData(_:)), name: .didSelectDistrict, object: nil)
        center.addObserver(self, selector: #selector(onGetUserData(_:)), name: .didSelectAge, object: nil)
        center.addObserver(self, selector: #selector(onGetUserData(_:)), name: .didSelectGender, object: nil)
        center.addObserver(self, selector: #selector(onGetUserData(_:)), name: .didSelectUserName, object: nil)
        center.addObserver(self, selector: #selector(onGetUserData(_:)), name: .didSelectEmail, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.post(name: .didFinish, object: nil, userInfo: nil)
    }
    
    @objc func onGetUserData(_ notification: Notification) {
        let userInfo = notification.userInfo as! [String: String]
        
        if userInfo["userName"] != nil {
            userName.setAttributedString(first: "Tên đăng nhập: ", second: userInfo["userName"] ?? "")
        }
        
        if userInfo["email"] != nil {
            Email.setAttributedString(first: "Email: ", second: userInfo["email"] ?? "")
        }
        
        if userInfo["district"] != nil {
            district.setAttributedString(first: "Quận / Huyện: ", second: userInfo["district"] ?? "")
        }
        
        if userInfo["age"] != nil {
            age.setAttributedString(first: "Tuổi: ", second: userInfo["age"] ?? "")
        }
        
        if userInfo["gender"] != nil {
            gender.setAttributedString(first: "Giới tính: ", second: userInfo["gender"] ?? "")
        }
        
        if userInfo["city"] != nil {
            city.setAttributedString(first: "Thành phố: ", second: userInfo["city"] ?? "")
        }
    }
}
