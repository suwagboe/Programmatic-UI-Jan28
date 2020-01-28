//
//  SettingsView.swift
//  Programmatic-UI-Jan28
//
//  Created by Pursuit on 1/28/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    
    
    //lazy property initializer
    public lazy var pickerView: UIPickerView = {
        let pv = UIPickerView()
        
        return pv
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit(){
        // Addsuperviews
        setUpPickerViewContraints()
    }
    
    private func setUpPickerViewContraints(){
        // 1.
    // a view controller is not a view so you do view.addSubView
        //
        addSubview(pickerView)
        
        // 2.
        pickerView.translatesAutoresizingMaskIntoConstraints = false // without this the contraints below will not work
        
        // 3. setup Constraints
        NSLayoutConstraint.activate([
            
            pickerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            pickerView.centerYAnchor.constraint(equalTo: centerYAnchor)
        
           // pickerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0)
            
        ])
        
        
    }
    
}
