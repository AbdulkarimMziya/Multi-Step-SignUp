//
//  VerificationViewController.swift
//  Multi-Step-SignUp
//
//  Created by Abdulkarim Mziya on 2026-04-12.
//

import UIKit

class VerificationViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [verificationTitleLabel,verificationSubTitleLabel,nextButton])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 24
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let verificationTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Verify Your Identity"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let verificationSubTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Help us verify your identity for added security."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .systemGray
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
        
        config.attributedTitle = AttributedString("Verify Account", attributes: container)
        
        let btn = UIButton(configuration: config)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .greyBackground

        addViews()
        setupConstraints()
        
        if let navBar = navigationController?.navigationBar,
            let progressBar = navBar.subviews.first(where: { $0 is UIProgressView }) as? UIProgressView {
            progressBar.setProgress(1.0, animated: true)
        }
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
