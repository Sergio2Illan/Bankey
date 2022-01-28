//
//  ViewController.swift
//  Bankey
//
//  Created by Sergio Illan Illan on 28/1/22.
//

import UIKit

class LoginViewController: UIViewController {
    
   private let loginView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }

}

extension LoginViewController {
    
    
   private func style(){
       loginView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    private func layout(){
        view.addSubview(loginView)
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
    }
}
