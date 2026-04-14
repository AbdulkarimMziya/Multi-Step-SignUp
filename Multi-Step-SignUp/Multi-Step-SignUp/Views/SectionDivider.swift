//
//  SectionDivider.swift
//  Multi-Step-SignUp
//
//  Created by Abdulkarim Mziya on 2026-04-13.
//

import UIKit

class SectionDivider: UIView {
    
    private let leftLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let rightLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let orLabel: UILabel = {
        let label = UILabel()
        label.text = "Or"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .systemGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [leftLine, orLabel, rightLine])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 70),
            
            leftLine.heightAnchor.constraint(equalToConstant: 1),
            rightLine.heightAnchor.constraint(equalToConstant: 1),
            orLabel.widthAnchor.constraint(equalToConstant: 30),
            
            leftLine.widthAnchor.constraint(equalTo: rightLine.widthAnchor)
        ])
    }
}

