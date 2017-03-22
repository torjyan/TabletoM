//
//  WelcomeScreenDriver.swift
//  Tableto
//
//  Created by Mher Torjyan on 3/21/17.
//  Copyright © 2017 Mher Torjyan. All rights reserved.
//

import UIKit

class WelcomeScreenDriver: UIViewController{
    
    lazy var createAccountButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = UIColor.white
        button.setTitle("Create an account", for: UIControlState())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.black, for: UIControlState())
        button.addTarget(self, action: #selector(handleCreateAnAccount), for: .touchUpInside)
        return button
    }()
    
    lazy var loginButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = UIColor.white
        button.setTitle("Login", for: UIControlState())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.black, for: UIControlState())
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.magenta
        
        view.addSubview(createAccountButton)
        view.addSubview(loginButton)
        
        setupCreateAccountButton()
        setupLoginButton()
    }
    
    func setupCreateAccountButton(){
        createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createAccountButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        createAccountButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        createAccountButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupLoginButton(){
        loginButton.rightAnchor.constraint(equalTo: view.rightAnchor , constant: -10).isActive = true
        loginButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
}
