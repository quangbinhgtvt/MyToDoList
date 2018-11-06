//
//  SignInViewController.swift
//  MyToDoList
//
//  Created by BinhPQ on 11/4/18.
//  Copyright © 2018 BinhPQ. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {

    //outlets
    @IBOutlet weak var subViewSignIn: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        custommizeSignInUI()
     
    }
    
    //customize UI
    func custommizeSignInUI(){
        //custom subview
        subViewSignIn.layer.borderWidth = 0.2
        subViewSignIn.layer.borderColor = UIColor.gray.cgColor
        subViewSignIn.layer.shadowOpacity = 0.5
        subViewSignIn.layer.shadowRadius = 1
        subViewSignIn.layer.backgroundColor = UIColor.groupTableViewBackground.cgColor
    }
    
    //actions
    @IBAction func clickSignInButton(_ sender: Any) {
        
        //Sign In
        guard let email = emailTextField.text else {return}
        guard let pass = passwordTextField.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: pass, completion: {(user, error) in
            //catch error
            if error != nil {
                if let errorCode = AuthErrorCode(rawValue: error!._code) {
                    switch errorCode {
                    case .userDisabled:
                        self.Alert(title: "InActive", message: "The account is inactive, please contact with us")
                    case .invalidEmail:
                        self.Alert(title: "Invalid Email", message: "Enter a valid email (eg. abc.1111@gmail.com)")
                    case .wrongPassword:
                        self.Alert(title: "Wrong Password", message: "This password does not match with the account")
                    default:
                        self.Alert(title: "Fail", message: "Fail to SignIn")
                        
                    }
                }
                
            }
            //push to List view
           
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let listView = sb.instantiateViewController(withIdentifier: "ListView") as! ListViewController
           
            listView.email = user?.user.email
            print(user?.user.email)
            self.performSegue(withIdentifier: "ListViewSegue", sender: self)
        })
        
        
        
    }
    
    // alert function
    
    //action form
    private func Alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction) in })
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }


}
