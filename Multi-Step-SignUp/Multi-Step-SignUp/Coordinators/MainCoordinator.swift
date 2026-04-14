//
//  MainCoordinator.swift
//  Multi-Step-SignUp
//
//  Created by Abdulkarim Mziya on 2026-04-13.
//

import Foundation

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    
    func start()
}

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginVC = LoginViewController()
        loginVC.coordinator = self
        loginVC.navigationItem.hidesBackButton = true
        navigationController.pushViewController(loginVC, animated: false)
    }
    
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
