//
//  MainCoordinator.swift
//  Multi-Step-SignUp
//
//  Created by Abdulkarim Mziya on 2026-04-13.
//

import Foundation

import UIKit

// This protocol defines the basic responsibilities of any Coordinator
// Coordinators are responsible for handling navigation (NOT ViewControllers)
protocol Coordinator: AnyObject {
    // The navigation controller that will handle screen transitions
    var navigationController: UINavigationController { get set }

    // This is the FIRST function that gets called to start the app flow
    func start()
}

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController // The navigation controller used to push/pop view controllers
    
    // Inject navigation controller (Dependency Injection)
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginVC = LoginViewController()
        // Give the ViewController access to the coordinator
        loginVC.coordinator = self // This allows the VC to ASK the coordinator to navigate
        loginVC.navigationItem.hidesBackButton = true
        
        // Push the first screen WITHOUT animation
        navigationController.pushViewController(loginVC, animated: false)
    }
    
    // MARK: - Navigation Functions
    func showProfilePage() {
        let profileVC = ProfileViewController()
        profileVC.coordinator = self
        profileVC.navigationItem.hidesBackButton = true
        navigationController.pushViewController(profileVC, animated: true)
    }
    
    func showVerificationPage() {
        let verificationVC = VerificationViewController()
        verificationVC.coordinator = self
        verificationVC.navigationItem.hidesBackButton = true
        navigationController.pushViewController(verificationVC, animated: true)
    }
    
}
