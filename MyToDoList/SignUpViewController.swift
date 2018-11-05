//
//  SignUpViewController.swift
//  MyToDoList
//
//  Created by BinhPQ on 11/4/18.
//  Copyright © 2018 BinhPQ. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

   //outlets
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var mainSubView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        customizeSignUpView()
    }
    //customize UI
    func customizeSignUpView(){
        //custom subview
        mainSubView.layer.borderColor = UIColor.gray.cgColor
        mainSubView.layer.borderWidth = 0.2
        mainSubView.layer.backgroundColor = UIColor.groupTableViewBackground.cgColor
        mainSubView.layer.shadowOpacity = 0.5
        //custom textfield
        emailView.layer.borderColor = UIColor.gray.cgColor
        emailView.layer.borderWidth = 0.2
        passwordView.layer.borderColor = UIColor.gray.cgColor
        passwordView.layer.borderWidth = 0.2
    }
    
    @IBAction func clickSignUpButton(_ sender: Any) {
        guard let email = emailTextField.text else {return}
        
//        if isValidEmail(email: email){
//            print("OK")
//        }
//        else{
//            //alert here
//            Alert(title: "Invalid Email", message: "Enter a valid email (abc@xyz.com)")
//        }
        
        guard let pass = passwordTextField.text else {return}
        
        if isValidPass(pass: pass){
            print("OK")
        }
        else {
            Alert(title: "Weak Password", message: "Enter a password with at least 8 characters with at least 1 uppercase, 1 lowercase , 1 number and 1 special character")
        }
        
        //create user on firebase
        
        Auth.auth().createUser(withEmail: email, password: pass, completion: {(authResult, error) in
            
            if error != nil {
            if let errCode = AuthErrorCode(rawValue: error!._code){
                switch errCode {
                case .invalidEmail:
                    self.Alert(title: "Invalid Email", message: "Enter an valid email (eg. abc.111@gmail.com)")
                case .emailAlreadyInUse:
                    self.Alert(title: "Email Alreade in Use", message: "This email is already in use, try annother email or sign in")
                default:
                    self.Alert(title: "Fail", message: "Fail to Create a User")
                }
            }
            }
            
            guard let user = authResult?.user else {return}

            
        })
        
    }
    
    //action form
    private func Alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction) in })
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }

}
