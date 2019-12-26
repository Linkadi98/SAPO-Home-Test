//
//  UIScrollView+Extension.swift
//  Sapo-Home-Test
//
//  Created by Minh Pham on 12/25/19.
//  Copyright © 2019 Sapo. All rights reserved.
//

import UIKit

extension UIScrollView {
    // MARK: - Keyboard issues
    func registerKeyboardForNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillbeHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    
    @objc private func keyboardWasShown(_ notification: Notification) {
        guard let info = notification.userInfo, let keyboardFrameValue = info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
            else {
                return
        }
        let keyboardFrame = keyboardFrameValue.cgRectValue
        let keyboardSize = keyboardFrame.size
        
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        
        contentInset = contentInsets
        scrollIndicatorInsets = contentInsets
    }
    
    @objc private func keyboardWillbeHidden(_ notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        contentInset = contentInsets
        scrollIndicatorInsets = contentInsets
    }
}
