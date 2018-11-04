//
//  SignInViewController.swift
//  MyToDoList
//
//  Created by BinhPQ on 11/4/18.
//  Copyright © 2018 BinhPQ. All rights reserved.
//

import UIKit

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

}
