//
//  ViewController.swift
//  Multi-Step-SignUp
//
//  Created by Abdulkarim Mziya on 2026-04-11.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var mainStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [loginTitleLabel,loginSubTitleLabel,userInfoStack,passwordHintLabel, nextBtnStack])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 4
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var userInfoStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [emailField,passwordField])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 24
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = .init(top: 16, left: 0, bottom: 0, right: 0)

        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var nextBtnStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [nextButton])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 24
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = .init(top: 16, left: 0, bottom: 0, right: 0)

        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    let loginTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Let's Get Started!"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let loginSubTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Set up your account credentials."
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailField: UIView = {
        let header = "Email Address"
        let placeholder = "example@mail.com"
        let iconName = "envelope"

        let emailField = CustomTextField()
        emailField.configure(
            header: header,
            placeholder: placeholder,
            iconName: iconName,
            isSecure: false
        )
        
        emailField.translatesAutoresizingMaskIntoConstraints = false
        return emailField
    }()
    
    let passwordField: UIView = {
        let header = "New Password"
        let placeholder = ""
        let iconName = "lock"

        let passwordField = CustomTextField()
        passwordField.configure(
            header: header,
            placeholder: placeholder,
            iconName: iconName,
            isSecure: false
        )
        
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        return passwordField
    }()
    
    let passwordHintLabel: UILabel = {
        let label = UILabel()
        label.text = "Password should be at least 8 characters long including uppercase letters, lowercase letters, numbers, and special."
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nextButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .limeGreen
        config.baseForegroundColor = .black
        config.cornerStyle = .large
        //internal padding
        config.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20)
        
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        config.attributedTitle = AttributedString("Next", attributes: container)
        
        let btn = UIButton(configuration: config)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .greyBackground
        
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

