//
//  ViewController.swift
//  Multi-Step-SignUp
//
//  Created by Abdulkarim Mziya on 2026-04-11.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var mainStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [loginTitleLabel,loginSubTitleLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 8
        stack.backgroundColor = .secondarySystemBackground
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let loginTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Let's Get Started!"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let loginSubTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Set up your account credentials."
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addViews()
        setupConstraints()
        
    }
    
    func addViews() {
        view.addSubview(mainStack)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }



}

