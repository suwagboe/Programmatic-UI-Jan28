//
//  settingsViewController.swift
//  Programmatic-UI-Jan28
//
//  Created by Pursuit on 1/28/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //private let settingsVieww = SettingsView()
    
    private let settingsV = SettingsView()
    
    // data for pickerView
    private let colors = ["Red", "Green", "Orange", "Blue", "White", "Yellow"]
    
    override func loadView() {
        view = settingsV
    }
    
    //

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPurple
        
        // configure delegate and dataSource of pickerView
        
        settingsV.pickerView.dataSource = self
         settingsV.pickerView.delegate = self
        
        let colorName = colors[0]
        view.backgroundColor = UIColor(named: colorName)
        
    }

}


extension SettingsViewController: UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return colors.count
    }
    
}

extension SettingsViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let colorName = colors[row]
        view.backgroundColor = UIColor(named: colorName)
    }
}

