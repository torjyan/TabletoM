//
//  LoginController+handlers.swift
//  Tableto
//
//  Created by Mher Torjyan on 2/28/17.
//  Copyright © 2017 Mher Torjyan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

extension LoginController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func handleLoginRegister(){
        if(loginRegisterSegmentedControl.selectedSegmentIndex == 0){
            handleLogin()
        }else{
            handleRegister()
        }
    }
    
    func handleLogin(){
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            print("Form is not valid")
            return
        }
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if(error != nil){
                print(error)
                return
            }
            //Sucessfully logged in user.
            self.dismiss(animated: true, completion: nil)
        })
        
    }
    
    func handleRegister() {
        guard let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text else {
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
            
            let imageName = NSUUID().uuidString
            
            let storageRef = FIRStorage.storage().reference().child("profile_images").child("\(imageName).png")
            
            
            if let uploadData = UIImagePNGRepresentation(self.profileImageView.image!){
                storageRef.put(uploadData, metadata: nil, completion: { (metadata, error) in
                    
                    if(error != nil){
                        print(error)
                        return
                    }
                    if let profileImageUrl = metadata?.downloadURL()?.absoluteString{
                        let values = ["name": name, "email": email, "profileImageURL": profileImageUrl]
                        self.registerUserIntoDatabase(uid: uid, values: values as [String : AnyObject])
                    }
                    
                })
            }
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
    
    func handleSelectProfileImageView(){
        print(123)
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage{
            selectedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker{
            profileImageView.image = selectedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //user hit cancel
        dismiss(animated: true, completion: nil)
    }
}
