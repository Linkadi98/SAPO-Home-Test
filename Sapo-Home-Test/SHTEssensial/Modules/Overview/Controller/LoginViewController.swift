//
//  LoginViewController.swift
//  Sapo-Home-Test
//
//  Created by Minh Pham on 12/25/19.
//  Copyright © 2019 Sapo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var username: UITextField! {
        didSet {
            username.createUnderlineTextField()
            
        }
    }
    @IBOutlet weak var email: UITextField! {
        didSet {
            email.createUnderlineTextField()
        }
    }
    @IBOutlet weak var password: UITextField! {
        didSet {
            password.createUnderlineTextField()
            
        }
    }
    @IBOutlet weak var repeatPassword: UITextField! {
        didSet {
            repeatPassword.createUnderlineTextField()
        }
    }
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = nextButton.frame.height / 2
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        scrollView.registerKeyboardForNotification()
        NotificationCenter.default.addObserver(self, selector: #selector(sendData), name: .didFinish, object: nil)
    }
    
    @objc func sendData() {
        NotificationCenter.default.post(name: .didSelectUserName, object: nil, userInfo: ["userName": username.text ?? ""])
        NotificationCenter.default.post(name: .didSelectUserName, object: nil, userInfo: ["email": email.text ?? ""])
    }
    
    @IBAction func userNameEditingChanged(_ sender: Any) {
        if !username.isValidUserName() {
            username.textColor = .red
        }
        else {
            username.textColor = .black
        }
    }
    
    @IBAction func emailEditingChanged(_ sender: Any) {
        if !email.isValidEmail() {
            email.textColor = .red
        }
        else {
            email.textColor = .black
        }
    }
    
    
}
