//
//  MainView.swift
//  Programmatic-UI-Jan28
//
//  Created by Pursuit on 1/28/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

// UIVIew

import UIKit

class MainView: UIView {
    
    let defaultMessage = "No default color is set please go to settings"
    
    // create a label
    // lazy var because it is only called when needed
    // line below type casts it
    public lazy var messageLabel: UILabel = {
        // this will only get the value once it is called.. and not before which is what lazy  does
        // inside of the closure syntax
        // the below initializes the label
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        // this makes it centered
        label.textAlignment = .center
        // if it is not lazy then the line below cannot be accessed.
        label.text = defaultMessage
        // because it says that after the MainView gets initiated.
        return label
    }() // () creates a closure and calls simultaneously...
    
    
//    var someLabel: UILabel = { // DOES NOT COMPILE
//        let label = UILabel()
//        // this attempts to make everything right awayh
//        label.text = defaultMessage
//        return label
//    }()
  
    
    // create a button
   public lazy var resetButton: UIButton = {
    let button = UIButton()
    button.setTitle("reset", for: .normal)
    button.setTitleColor(.white, for: .normal)
    return button
    }()
    

// if view is done programmatically this one will get called.
    override init(frame: CGRect){
        super.init(frame: UIScreen.main.bounds)
        //here we are required to also have an
        commonInit()
    }
    
    
   // if this view gets initialized from storyboard this init gets called
    required init?(coder: NSCoder) {
        // this init could fail.. so it is optional..
        super.init(coder: coder)
        commonInit()
    }
    
    
    private func commonInit(){
        setUpMessageLabelContraints()
        setUpResetButtonConstraints()
    }
    
    private func setUpMessageLabelContraints() {
        //add the message label to teh MainView
        addSubview(messageLabel) // return the message we created above.
        
        
        // set the constraints for the label.
        // it is automatically set to use auto layout.. which is with story board and you need to make it stop
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // manages constraints in code
        // put it in an array
        NSLayoutConstraint.activate([
            //set top anchor 20 points from the safe area top
            // setting constraints on message label
            
            // going down is postive.. right is positive
            // move from the trailing(right) to the left it is negative
            // move from the leading(left) to the right is positive
            messageLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            
            // set padding at the leading edge of the Main
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            // set padding at the trailing edge of the MainView
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    private func setUpResetButtonConstraints(){
        
        addSubview(resetButton)
        
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        // below is how you do it without the area
     //   resetButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 60).isActive = true
        
        
        // below is the array of contraints.
        NSLayoutConstraint.activate([
        
            // only two contraints because the button knows its size
            resetButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 60),
            
            resetButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            
            //resetButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30)
            
           // resetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: <#T##CGFloat#>)
        
        ])
        
    }
    
}
