//
//  CustomTextField.swift
//  Multi-Step-SignUp
//
//  Created by Abdulkarim Mziya on 2026-04-11.
//

import UIKit

class CustomTextField: UIView {
    
    lazy var mainStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [headerLabel,textField])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let textField: UITextField = {
        let field = UITextField()
        field.textAlignment = .natural
        field.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        field.layer.cornerRadius = 8
        field.layer.borderColor = UIColor.systemRed.cgColor
        field.layer.borderWidth = 1
        field.clipsToBounds = true
        field.heightAnchor.constraint(equalToConstant: 48).isActive = true
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainStack)
            
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(header: String, placeholder: String, iconName: String, isSecure: Bool = false) {
        headerLabel.text = header
        textField.placeholder = placeholder
        textField.isSecureTextEntry = isSecure
        
        // TODO: add icon in textfield
        let iconImage = UIImage(systemName: iconName)
        
        // Handle specific keyboard types
        if header.lowercased().contains("email") {
            textField.keyboardType = .emailAddress
        }
    }
}
