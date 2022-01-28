//
//  LoginView.swift
//  Bankey
//
//  Created by Sergio Illan Illan on 28/1/22.
//

import UIKit

class LoginView: UIView {
    
    //MARK: - Porperties
    
    let usernameTextField = UITextField()
    
    
    //MARK: - Init
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
    
    
    
    
}

//MARK: - Extension

extension LoginView {
    
    //MARK: - Methods
    
    func style(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemMint
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Username"
        usernameTextField.delegate = self
    }
    
    func layout(){
        
    }
    
}


//MARK: - UITextFieldDelegate Methods

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }else {
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
    }
}

