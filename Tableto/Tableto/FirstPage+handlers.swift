//
//  FirstPage+handlers.swift
//  Tableto
//
//  Created by Mher Torjyan on 3/18/17.
//  Copyright © 2017 Mher Torjyan. All rights reserved.
//

import UIKit


extension FirstLoginPageController: UINavigationControllerDelegate{
 
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
