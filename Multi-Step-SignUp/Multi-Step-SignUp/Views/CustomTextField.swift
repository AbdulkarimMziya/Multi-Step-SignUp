//
//  CustomTextField.swift
//  Multi-Step-SignUp
//
//  Created by Abdulkarim Mziya on 2026-04-11.
//

import UIKit

class CustomTextField: UIView {
    
    var text: String? {
        get { return textField.text }
        set { textField.text = newValue }
    }
    
    var inputViewOverride: UIView? {
        get { return textField.inputView }
        set { textField.inputView = newValue }
    }

    var inputAccessoryViewOverride: UIView? {
        get { return textField.inputAccessoryView }
        set { textField.inputAccessoryView = newValue }
    }

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
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textField: UITextField = {
        let field = UITextField()
        field.textColor = .white
        field.textAlignment = .natural
        field.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        field.layer.cornerRadius = 8
        field.layer.borderColor = UIColor.systemGray4.cgColor
        field.layer.borderWidth = 1
        field.clipsToBounds = true
        field.heightAnchor.constraint(equalToConstant: 48).isActive = true
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainStack)
            
        textField.addTarget(self, action: #selector(handleEditingDidBegin), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(handleEditingDidEnd), for: .editingDidEnd)

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
        
        
        if let iconImage = UIImage(systemName: iconName){
            textField.leftView = setLeftViewIcon(iconImage)
        }
        
        // Handle specific keyboard types
        if header.lowercased().contains("email") {
            textField.keyboardType = .emailAddress
        }
    }
    
    private func setLeftViewIcon(_ image: UIImage) -> UIView {
        let iconView = UIImageView(image: image)
        iconView.tintColor = .white
        iconView.contentMode = .scaleAspectFit
        
        // 1. Create a container to provide padding
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        
        // 2. Set the icon frame within that container
        iconView.frame = CGRect(x: 10, y: 0, width: 20, height: 20)
        containerView.addSubview(iconView)
        
        // 3. IMPORTANT: Tell the textfield to actually show the view
        textField.leftViewMode = .always
        
        return containerView
    }
    
    @objc
    private func handleEditingDidBegin() {
        textField.layer.borderColor = UIColor.limeGreen.cgColor // Highlight
        textField.layer.borderWidth = 2
    }

    @objc
    private func handleEditingDidEnd() {
        textField.layer.borderColor = UIColor.systemGray4.cgColor // Reset
        textField.layer.borderWidth = 1
    }


}
