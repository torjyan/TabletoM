//
//  CreateDriverController.swift
//  Tableto
//
//  Created by Mher Torjyan on 3/21/17.
//  Copyright © 2017 Mher Torjyan. All rights reserved.
//

import UIKit
import Firebase

class CreateDriverController: UIViewController{
 
    lazy var createNumber: UITextField = {
        var tf = UITextField()
        tf.placeholder = "     Your number"
        tf.setupBorder()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var createName: UITextField = {
        var tf = UITextField()
        tf.placeholder = "     Your name"
        tf.setupBorder()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var createPassword: UITextField = {
        var tf = UITextField()
        tf.placeholder = "     Your Password"
        tf.setupBorder()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var createEmail : UITextField = {
        var tf = UITextField()
        tf.placeholder = "     Your Email"
        tf.setupBorder()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var backButton: UIButton = {
        var but = UIButton()
        let image = UIImage(named: "backButton")
        but.setImage(image, for: UIControlState())
        but.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        but.imageView?.contentMode = .scaleAspectFit
        but.imageEdgeInsets = UIEdgeInsetsMake(30, 30, 30, 15)
        but.translatesAutoresizingMaskIntoConstraints = false
        
        return but
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.blue
        button.setTitle("Create Account", for: UIControlState())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: UIControlState())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "backButton")
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(createName)
        view.addSubview(createEmail)
        view.addSubview(createPassword)
        view.addSubview(backButton)
        view.addSubview(nextButton)
        
        setupCreateName()
        setupEmail()
        setupPassword()
        setupBackButtton()
        setupNextButton()
        self.hideKeyboardWhenTappedAround()
    }
    
    func setupNextButton(){
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.topAnchor.constraint(equalTo: createPassword.bottomAnchor, constant: 20).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setupBackButtton(){
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
    }
    
    func setupCreateName(){
        createName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createName.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -170).isActive = true
        createName.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -10).isActive = true
        createName.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupEmail(){
        createEmail.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createEmail.topAnchor.constraint(equalTo: createName.bottomAnchor, constant: 10).isActive = true
        createEmail.widthAnchor.constraint(equalTo: createName.widthAnchor).isActive = true
        createEmail.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    func setupPassword(){
        createPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createPassword.topAnchor.constraint(equalTo: createEmail.bottomAnchor, constant: 10).isActive = true
        createPassword.widthAnchor.constraint(equalTo: createName.widthAnchor).isActive = true
        createPassword.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
}



