//
//  UITextField+Extension.swift
//  Sapo-Home-Test
//
//  Created by Minh Pham on 12/25/19.
//  Copyright © 2019 Sapo. All rights reserved.
//

import UIKit

extension UITextField {
    
    open func createUnderlineTextField() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: frame.height + 3, width: frame.width, height: 1)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        
        layer.addSublayer(bottomLine)
    }
    
    
    func isValidUserName() -> Bool {
        guard let userName = self.text else {
            return false
        }
        
        if userName.count > 8 && !userName.contains(" ") {
            return true
        }
        else {
            return false
        }
        
    }
    
    func isValidUserNameRegister() -> Bool {
        guard let userName = self.text else {
            return false
        }
        
        if userName.count > 5 && !userName.contains(" ") {
            return true
        }
        
        return false
    }
    
    func isValidEmail() -> Bool {
        guard let email = self.text else {
            return false
        }
        
        if email.contains("@") && email.contains(".com") && !email.contains(" ") {
            return true
        }
        
        return false
    }
    
    func isValidPassword() -> Bool {
        guard let pass = self.text else {
            return false
        }
        
        if pass.count > 5 {
            return true
        }
        
        return false
    }
    
    func confirmPassword(to password: String) -> Bool {
        guard let confirmPassword = self.text else {
            return false
        }
        
        if confirmPassword == password {
            return true
        }
        
        return false
    }
}

extension UILabel {
    open func createUnderlineLabel() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: frame.height + 3, width: frame.width, height: 1)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        
        layer.addSublayer(bottomLine)
    }
}
