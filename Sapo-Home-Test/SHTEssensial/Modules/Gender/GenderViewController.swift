//
//  GenderViewController.swift
//  Sapo-Home-Test
//
//  Created by Minh Pham on 12/26/19.
//  Copyright © 2019 Sapo. All rights reserved.
//

import UIKit

class GenderViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var maleButton: SHTRadioButton!
    @IBOutlet weak var femaleButton: SHTRadioButton!
    @IBOutlet weak var otherButton: SHTRadioButton!
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = nextButton.frame.height / 2
        }
    }
    
    
    
    var ages: [String] {
        var _ages = [String]()
        for age in 8...80 {
            _ages.append("\(age)")
        }
        return _ages
    }
    
    var isSelectedRadioButton = false
    var selectedAge: String?
    var selectedGender: String?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        80 - 8
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ages[row]
    }
    
    @IBOutlet weak var agePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        agePicker.delegate = self
        agePicker.dataSource = self
        
        agePicker.selectRow(17, inComponent: 0, animated: false)
        
        NotificationCenter.default.addObserver(self, selector: #selector(sendData), name: .didFinish, object: nil)
        // Do any additional setup after loading the view.
    }
    
    @objc func sendData() {
        NotificationCenter.default.post(name: .didSelectAge, object: nil, userInfo: ["age": "\(selectedAge ?? "")" ])
        NotificationCenter.default.post(name: .didSelectGender, object: nil, userInfo: ["gender": "\(selectedGender ?? "")"])
    }
    
    
    @IBAction func male(_ sender: SHTRadioButton) {
        sender.isSelected = !sender.isSelected
        femaleButton.isSelected = false
        otherButton.isSelected = false
        selectedGender = "Nam"
    }
    
    @IBAction func female(_ sender: SHTRadioButton) {
        sender.isSelected = !sender.isSelected
        maleButton.isSelected = false
        otherButton.isSelected = false
        selectedGender = "Nữ"
    }
    
    @IBAction func other(_ sender: SHTRadioButton) {
        sender.isSelected = !sender.isSelected
        maleButton.isSelected = false
        femaleButton.isSelected = false
        selectedGender = "Khác"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedAge = ages[row]
    }
    
    @IBAction func gotoGeneralInfoView(_ sender: Any) {
        performSegue(withIdentifier: "generalInfoSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "generalInfoSegue" {
            
        }
    }
}
