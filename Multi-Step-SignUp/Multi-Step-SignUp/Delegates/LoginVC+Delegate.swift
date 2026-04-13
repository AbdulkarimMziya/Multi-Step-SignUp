//
//  LoginVC+Delegate.swift
//  Multi-Step-SignUp
//
//  Created by Abdulkarim Mziya on 2026-04-12.
//

import UIKit

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let input = textField.text {
            print("Saved text: \(input)")
        }
        
        textField.resignFirstResponder()
        return true
    }
}
