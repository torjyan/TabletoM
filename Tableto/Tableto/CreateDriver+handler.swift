//
//  CreateDriver+handler.swift
//  Tableto
//
//  Created by Mher Torjyan on 3/21/17.
//  Copyright © 2017 Mher Torjyan. All rights reserved.
//

import UIKit
import Firebase

extension CreateDriverController{
    
    func handleRegister() {
        guard let email = createEmail.text, let password = createPassword.text, let name = createName.text else {
            print("Form is not valid")
            return
        }
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user: FIRUser?, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            guard let uid = user?.uid else {
                return
            }
            //successfully authenticated user
            
            let values = ["name": name, "email": email]
            self.registerUserIntoDatabase(uid: uid, values: values as [String : AnyObject])
            
        })
    }
    
    private func registerUserIntoDatabase(uid: String, values: [String: AnyObject]){
        let ref = FIRDatabase.database().reference(fromURL: "https://tableto-6ad97.firebaseio.com/")
        let usersReference = ref.child("users").child(uid)
        usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
            
            if err != nil {
                print(err)
                return
            }
            
            self.dismiss(animated: true, completion: nil)
            
            print("Saved user successfully into Firebase db")
            
        })
        
    }
    
    
    func backButtonPressed(){
        let mainMenu = FirstLoginPageController()
        present(mainMenu, animated: true, completion: nil)
    }

    
}
