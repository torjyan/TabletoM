//
//  WelcomDriver+handler.swift
//  Tableto
//
//  Created by Mher Torjyan on 3/21/17.
//  Copyright © 2017 Mher Torjyan. All rights reserved.
//

import UIKit

extension WelcomeScreenDriver{
    func handleCreateAnAccount(){
        print("In Create An Account")
        let createAccount = CreateAccountController()
        present(createAccount, animated: true, completion: nil)
    }
    
    func handleLogin(){
        print("In Login")
        let loginInfo = GetLoginInfoController()
        present(loginInfo, animated: true, completion: nil)
    }
}
