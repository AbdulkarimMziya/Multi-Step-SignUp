//
//  SceneDelegate.swift
//  Multi-Step-SignUp
//
//  Created by Abdulkarim Mziya on 2026-04-11.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var coordinator: MainCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let navigation = UINavigationController()
        
        coordinator = MainCoordinator(navigationController: navigation)
        
        // 1. Setup the Progress Bar
        let progressBar = UIProgressView(progressViewStyle: .default)
        progressBar.progressTintColor = .limeGreen
        progressBar.trackTintColor = .systemGray4
        progressBar.progress = 0.02
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        
        // 2. Add to Navigation Bar
        navigation.navigationBar.addSubview(progressBar)
        
        // 3. Constraints to pin it to the bottom
        NSLayoutConstraint.activate([
            progressBar.leadingAnchor.constraint(equalTo: navigation.navigationBar.leadingAnchor ,constant: 20),
            progressBar.trailingAnchor.constraint(equalTo: navigation.navigationBar.trailingAnchor,constant: -20),
            progressBar.centerYAnchor.constraint(equalTo: navigation.navigationBar.centerYAnchor),
            progressBar.heightAnchor.constraint(equalToConstant: 8)
        ])
        
        coordinator?.start()
        
        window.rootViewController = navigation
        
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
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

