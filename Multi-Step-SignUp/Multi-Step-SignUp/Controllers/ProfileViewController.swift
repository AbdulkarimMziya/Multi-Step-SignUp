//
//  ProfileViewController.swift
//  Multi-Step-SignUp
//
//  Created by Abdulkarim Mziya on 2026-04-12.
//

import UIKit

class ProfileViewController: UIViewController {
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [profileTitleLabel,profileSubTitleLabel,fullnameField,dobField,genderStack,employmentField, nextButton])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 24
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var genderStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [genderLabel,radioButtonStack])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var radioButtonStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [maleRadioButton,femaleRadioButton,otherRadioButton])
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 8
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    let profileTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Account Setup"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let profileSubTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Please provide your information to create your account."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let fullnameField: UIView = {
        let header = "Full Name"
        let placeholder = "Full Name"
        let iconName = "person"

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
    
    let dobField: CustomTextField = {
        let header = "Date Of Birth"
        let placeholder = "Date Of Birth"
        let iconName = "calendar.badge.plus"

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
    
    private let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Gender"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let maleRadioButton: RadioButton = {
        let rb = RadioButton()
        rb.radioButton.configuration?.image = UIImage(systemName: "circle")
        rb.translatesAutoresizingMaskIntoConstraints = false
        return rb
    }()

    let femaleRadioButton: RadioButton = {
        let rb = RadioButton()
        rb.radioButton.configuration?.image = UIImage(systemName: "circle")
        rb.translatesAutoresizingMaskIntoConstraints = false
        return rb
    }()

    let otherRadioButton: RadioButton = {
        let rb = RadioButton()
        rb.radioButton.configuration?.image = UIImage(systemName: "circle")
        rb.translatesAutoresizingMaskIntoConstraints = false
        return rb
    }()
    
    let employmentField: UIView = {
        let header = "Employment Status"
        let placeholder = "Employment Status"
        let iconName = "bag"

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
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .greyBackground

        addViews()
        setupConstraints()
        setupDatePicker()
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }

    func addViews() {
        view.addSubview(mainStack)
        
        maleRadioButton.configure(title: "Male")
        femaleRadioButton.configure(title: "Female")
        otherRadioButton.configure(title: "Other")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            radioButtonStack.heightAnchor.constraint(equalToConstant: 144)
        ])
    }
    
    func setupDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        
        // Using your CustomTextField overrides
        dobField.inputViewOverride = datePicker
        dobField.inputAccessoryViewOverride = createToolbar()
    }
    
    func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.barStyle = .black
        
        // Pushes the 'Done' button to the right
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        
        toolbar.setItems([flexSpace, doneButton], animated: true)
        return toolbar
    }

    @objc func donePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        // Assuming dobField is your CustomTextField
        dobField.text = formatter.string(from: datePicker.date)

        view.endEditing(true)
    }

    
    @objc
    func nextButtonTapped() {
        let verificationVC = VerificationViewController()
        verificationVC.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(verificationVC, animated: true)
       
    }
}
