//
//  ViewController.swift
//  Bankey
//
//  Created by Sergio Illan Illan on 28/1/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Porperties
    
    private let loginView = LoginView()
    private let signInButton = UIButton(type: .system)
    private let errorMessageLabel = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    var password: String? {
        return loginView.passwordTextField.text
    }

    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }

}


//MARK: - Extension Methods

extension LoginViewController {
    
    
   private func style(){
       loginView.translatesAutoresizingMaskIntoConstraints = false
       
       signInButton.translatesAutoresizingMaskIntoConstraints = false
       signInButton.setTitle("Sign In", for: [])
       signInButton.configuration = .filled()
       signInButton.configuration?.imagePadding = 8 //for indicator spacing
       signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
       
       errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
       errorMessageLabel.textAlignment = .center
       errorMessageLabel.textColor = .systemRed
       errorMessageLabel.numberOfLines = 0
       errorMessageLabel.isHidden = false
       //errorMessageLabel.text = "Error Failure"
    }
    
    
    private func layout(){
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        //LoginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        
        //Button
         NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: loginView.leadingAnchor, multiplier: 1),
            loginView.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 1)
        ])
        
        //Label
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: errorMessageLabel.trailingAnchor, multiplier: 1)
        ])
        
    }
    
}

//MARK: - Actions
extension LoginViewController {
    
    @objc private func signInTapped(sender: UIButton){
        errorMessageLabel.isHidden = true
        login()
        
    }
    
    private func login(){
        guard let username = username, let password = password else {
            assertionFailure("Username / Password  should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / Password cannot be blank")
            return
        }
        
        if username == "Kevin" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Username / Password are not correct")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = false
    }
}
