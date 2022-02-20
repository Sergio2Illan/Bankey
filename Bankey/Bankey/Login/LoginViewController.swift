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
    private let titleApp = UILabel()
    private let descriptionApp = UILabel()
    
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
       
       titleApp.translatesAutoresizingMaskIntoConstraints = false
       titleApp.textAlignment = .center
       titleApp.numberOfLines = 0
       titleApp.text = "Bankey"
       titleApp.font = titleApp.font.withSize(35)
       
       descriptionApp.translatesAutoresizingMaskIntoConstraints = false
       descriptionApp.textAlignment = .center
       descriptionApp.numberOfLines = 0
       descriptionApp.text = "Your premium source for all things banking!"
       descriptionApp.font = descriptionApp.font.withSize(25)
       
    }
    
    
    private func layout(){
        view.addSubview(titleApp)
        view.addSubview(descriptionApp)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        //titleApp
        NSLayoutConstraint.activate([
            titleApp.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 15),
            titleApp.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: titleApp.trailingAnchor, multiplier: 1)
        ])
        
        //DescriptionApp
        NSLayoutConstraint.activate([
            descriptionApp.topAnchor.constraint(equalToSystemSpacingBelow: titleApp.bottomAnchor, multiplier: 5),
            descriptionApp.leadingAnchor.constraint(equalToSystemSpacingAfter: titleApp.leadingAnchor, multiplier: 1),
            titleApp.trailingAnchor.constraint(equalToSystemSpacingAfter: descriptionApp.trailingAnchor, multiplier: 1)
        ])
        
        //LoginView
        NSLayoutConstraint.activate([
            //loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: descriptionApp.bottomAnchor, multiplier: 5),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: titleApp.leadingAnchor, multiplier: 1),
            titleApp.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
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
