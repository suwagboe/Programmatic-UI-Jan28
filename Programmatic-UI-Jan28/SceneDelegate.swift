//
//  SceneDelegate.swift
//  Programmatic-UI-Jan28
//
//  Created by Pursuit on 1/28/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: AFTER iOS 13
        // allow for the programtic set up for UI code.
        // must set up the root view controller property of the window
        // e.x window.rootViewController = ViewController()
        // allows for ipads to have multiple windows inside of a single app.
    
    // MARK: Steps to removing the default Main.Storyboard file from the info.plist
        // 1. delete the "Main storyboard" entry from the info.plist
        // 2. delete the storyboard name value from the "Scene configuration"
        // 3. delete the Main.storyboard file (optional)
        // 4. when loading the app the screen should be black
    
    var window: UIWindow?
        // window value is nil

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        //MARK: you need to put... 
        
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        // MARK: Steps in confirguring programmatic UI in the SceneDelegate
                    // steps to configure window property
            // 1. set up the window frame with a value to be the entire device screen
        
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        
        // tell the frame to take the entire size of the device
        // instantiating the window with a frame
        window = UIWindow(frame: UIScreen.main.bounds)
        // CGRect is the origin(x,y)- where the object starts.. the top left edge of device. and the size.
        // UIScreen.main is the entire screen
        window?.windowScene = windowScene
        
    // window needs a root view controller
    // rootController tells it where to START
    // entry point of the app
        //window?.rootViewController = settingsViewController()
        
    // embedding a UIViewController in a UINavigationController
        window?.rootViewController = UINavigationController(rootViewController: MainViewController())
        
        // make it visible. 
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

