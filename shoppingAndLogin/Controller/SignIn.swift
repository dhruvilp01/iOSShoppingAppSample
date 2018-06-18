//
//  ViewController.swift
//  shoppingAndLogin
//
//  Created by Dhruvil Patel on 6/15/18.
//  Copyright © 2018 Dhruvil. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignIn: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var emailTxtField: TextFieldAndView!
    
   
    @IBOutlet weak var passTxtField: TextFieldAndView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        emailTxtField.delegate = self
        passTxtField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTxtField.resignFirstResponder()
        passTxtField.resignFirstResponder()
    }


    @IBAction func submitBtn(_ sender: Any) {
        
        if self.emailTxtField.text == "" || self.passTxtField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            Auth.auth().signIn(withEmail: self.emailTxtField.text!, password: self.passTxtField.text!) { (user, error) in
                
                if error == nil {
                    
                    //Print into the console if successfully logged in
                    print("You have successfully logged in")
                    
                    //Go to the HomeViewController if the login is sucessful
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
    }
    
    }
    
}

