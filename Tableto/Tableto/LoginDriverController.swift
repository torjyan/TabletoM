//
//  loginDriver.swift
//  Tableto
//
//  Created by Mher Torjyan on 3/21/17.
//  Copyright © 2017 Mher Torjyan. All rights reserved.
//

import UIKit
import Firebase

class LoginDriverController: UIViewController{
    
    lazy var getLoginName: UITextField={
        var tf = UITextField()
        tf.placeholder = "     Email"
        tf.setupBorder()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var getLoginPassword: UITextField = {
        var tf = UITextField()
        tf.placeholder = "     Password"
        tf.setupBorder()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        view.addSubview(getLoginName)
        view.addSubview(getLoginPassword)
        view.addSubview(nextButton)
        view.addSubview(backButton)
        
        //addScrollView()
        addLoginName()
        addLoginPassword()
        setupBackButtton()
        setupNextButton()
        
        self.hideKeyboardWhenTappedAround()
    }
    
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
        button.setTitle("Login", for: UIControlState())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: UIControlState())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleLoginUser), for: .touchUpInside)
        return button
        
    }()
    
    func backButtonPressed(){
        let mainMenu = FirstLoginPageController()
        present(mainMenu, animated: true, completion: nil)
    }
    
    func handleLoginUser(){
        guard let email = getLoginName.text, let password = getLoginPassword.text else {
            print("Form is not valid")
            return
        }
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if(error != nil){
                print(error)
                return
            }
            //Sucessfully logged in user.
            // print(user?.displayName)
            self.dismiss(animated: true, completion: nil)
        })
        
    }
    
    
    func setupBackButtton(){
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
    }
    
    func setupNextButton(){
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.topAnchor.constraint(equalTo: getLoginPassword.bottomAnchor, constant: 20).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func addLoginName(){
        getLoginName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        getLoginName.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        getLoginName.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -10).isActive = true
        getLoginName.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func addLoginPassword(){
        getLoginPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        getLoginPassword.topAnchor.constraint(equalTo: getLoginName.bottomAnchor, constant: 10).isActive = true
        getLoginPassword.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -10).isActive = true
        getLoginPassword.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

}


