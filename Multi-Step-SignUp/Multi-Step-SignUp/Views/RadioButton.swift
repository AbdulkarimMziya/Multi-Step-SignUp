//
//  RadioButton.swift
//  Multi-Step-SignUp
//
//  Created by Abdulkarim Mziya on 2026-04-12.
//

import UIKit

class RadioButton: UIView {

    let frameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12 // Rounded rectangle
        view.backgroundColor = .greyBackground // Use your custom color
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray4.cgColor
        view.clipsToBounds = true
        return view
    }()
    
    let radioButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.title = "<option>"
        config.image = UIImage(systemName: "circle")
        config.imagePlacement = .leading
        config.imagePadding = 8
        
        let btn = UIButton(configuration: config)
        btn.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(frameView)
        frameView.addSubview(radioButton)
        
        NSLayoutConstraint.activate([
            frameView.topAnchor.constraint(equalTo: topAnchor),
            frameView.leadingAnchor.constraint(equalTo: leadingAnchor),
            frameView.trailingAnchor.constraint(equalTo: trailingAnchor),
            frameView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // Pin button to the top-left of the frame
            radioButton.topAnchor.constraint(equalTo: frameView.topAnchor, constant: 4),
            radioButton.leadingAnchor.constraint(equalTo: frameView.leadingAnchor, constant: 1),
        ])
    }
    
    func configure(title: String) {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            
        // Apply the attributed title to the configuration
        radioButton.configuration?.attributedTitle = AttributedString(title, attributes: container)
    }
    
}
