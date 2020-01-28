//
//  ViewController.swift
//  Programmatic-UI-Jan28
//
//  Created by Pursuit on 1/28/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    // want the mainView to be the entire view inside of this MainViewController
    
    private let mainView = MainView()
    
    // if doing progtammatic UI implement and setup the view
    // in loadView()
    // loadView() gets called before viewDidLoad()
    // loadView() sets up the inital view of the controller
    // do not call super when overriding loadView()
    
    override func loadView() {
        // does the set up for the view
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // use system colors so it can configure to dark mode.
                    view.backgroundColor = .systemPink
       configureNavBar()
        
        //add target action for reset
        mainView.resetButton.addTarget(self, action: #selector(resetAppColor(_:)), for: .touchUpInside)
    }
    
    private func configureNavBar() {
               // set title of navigation bar
               navigationItem.title = "Programmatic UI"
               
               //adding a UIBarButton to the navigation item
               navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(showSettings(_:)))
        
    }
    
    @objc
    private func showSettings(_ sender: UIBarButtonItem) {
// put the segue to  settings viewController
      
// create an instance of the settings view controller
        let settingsVC = SettingsViewController()
        
        // different ways to transiton
//        present(settingsVC,animated: true)
//        settingsVC.modalPresentationStyle = .overCurrentContext
//        settingsVC.modalTransitionStyle = .flipHorizontal
        
        navigationController?.pushViewController(settingsVC, animated: true)
        // view controller might not be in a navigation controller and if you want the below items...
        //  for the back button and if you want the left to right transtion..
        
        // no longer have storybord so you cant do: guard let settingsController = storyboard?.instantiateViewController(identifier: "SettingsViewController") as? SettingsViewController else {... because there is no storyboard AVAIABLE to instantiate.
    }
    
    @objc
    private func resetAppColor(_ sender: UIButton){
        print("reset background color")
        
    }
    
}

