//
//  SignUpVC.swift
//  shoppingAndLogin
//
//  Created by Dhruvil Patel on 6/15/18.
//  Copyright © 2018 Dhruvil. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignUpVC: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var nameTxtFiled: TextFieldAndView!
    @IBOutlet weak var emailidTxtField: TextFieldAndView!
    @IBOutlet weak var passTxtField: TextFieldAndView!
    
    
    var ref : DatabaseReference!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailidTxtField.delegate = self
        passTxtField.delegate = self
        nameTxtFiled.delegate = self
        
        ref = Database.database().reference()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailidTxtField.resignFirstResponder()
        passTxtField.resignFirstResponder()
       nameTxtFiled.resignFirstResponder()
    }
    

    @IBAction func submitBtn(_ sender: Any) {
        
        if emailidTxtField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            
            
            
            Auth.auth().createUser(withEmail: emailidTxtField.text!, password: passTxtField.text!) { (user, error) in
                
                if error == nil {
                    
                    print("You have successfully signed up")
                    
                  //  let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignIn")
                  //  self.present(vc!, animated: true, completion: nil)
                    
                    let userID: String = user!.uid
                    let userEmail: String = self.emailidTxtField.text!
                    let userPassword: String = self.passTxtField.text!
                    let username: String = self.nameTxtFiled.text!
                    
                    self.ref.child("Users").child(userID).setValue(["Name":username, "Email":userEmail, "Password":userPassword])
                    
//                    let alertController = UIAlertController(title: "Succesfully Created", message: "You created account with Name: \(username), Email: \(userEmail)", preferredStyle: .alert)
//                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//                    alertController.addAction(defaultAction)
//                    self.present(alertController, animated: true, completion: nil)
                   
                    let alertController = UIAlertController(title: "Succesfully Created", message: "You created account with Name: \(username), Email: \(userEmail)", preferredStyle: .alert)
                    
                    let declineAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                    let acceptAction = UIAlertAction(title: "OK", style: .default) { (_) -> Void in
                        
                        self.performSegue(withIdentifier: "SignIn", sender: self) // Replace SomeSegue with your segue identifier (name)
                    }
                    
                    alertController.addAction(declineAction)
                    alertController.addAction(acceptAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
                
                
                
            }
    }
    
  }
}
