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
        
        if isValidEmail(email: email){
            
        }
        else{
            //alert here
            Alert(title: "Invalid Email", message: "Enter a valid email (abc@xyz.com)")
        }
        
        guard let pass = passwordTextField.text else {return}
        
        if isValidPass(pass: pass){
            
        }
        else {
            Alert(title: "Weak Password", message: "Enter a password with at least 8 characters with at least 1 uppercase, 1 lowercase , 1 number and 1 special character")
        }
        
    }
    
    //action form
    private func Alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction) in })
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }

}
