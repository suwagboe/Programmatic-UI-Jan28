//
//  settingsViewController.swift
//  Programmatic-UI-Jan28
//
//  Created by Pursuit on 1/28/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

struct AppKey {
    // want to capture the constant.
    static let appColorKey = "app color"
}

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
        // gets called only on initial load so only once
        super.viewDidLoad()

       // view.backgroundColor = UIColor(named: colorName)
        
        // configure delegate and dataSource of pickerView
        
        settingsV.pickerView.dataSource = self
         settingsV.pickerView.delegate = self
        
        let colorName = colors[0]
        view.backgroundColor = UIColor(named: colorName)
        
        //updateAppColor()
        
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
        // this where you capture the selected color
        
        let colorName = colors[row]
        view.backgroundColor = UIColor(named: colorName)
        
        // save color name to user defaults
        UserDefaults.standard.set(colorName, forKey: AppKey.appColorKey)
        
        
    }
}

