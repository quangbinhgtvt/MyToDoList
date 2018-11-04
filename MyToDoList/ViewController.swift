//
//  ViewController.swift
//  MyToDoList
//
//  Created by BinhPQ on 11/4/18.
//  Copyright © 2018 BinhPQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //outlets
    
    @IBOutlet weak var subview: UIView!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeUI()

    }

    //customize UIView
    func customizeUI(){
        
        //subview
        subview.layer.shadowColor = UIColor.lightGray.cgColor
        subview.layer.shadowOpacity = 1
        subview.layer.shadowRadius = 1
        subview.layer.borderWidth = 0.2
        subview.layer.borderColor = UIColor.lightGray.cgColor
        subview.layer.backgroundColor =  UIColor.groupTableViewBackground.cgColor
        //signup button
        signUpButton.layer.borderWidth = 0.2
        signUpButton.layer.shadowRadius = 1
        signUpButton.layer.shadowOpacity = 0.5
        
        //singin button
        signInButton.layer.cornerRadius = 1
        signInButton.layer.borderColor = UIColor.magenta.cgColor
        signInButton.layer.borderWidth = 0.2
        signInButton.layer.shadowRadius = 1
        signInButton.layer.shadowOpacity = 0.5
        signInButton.layer.shadowColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 100).cgColor
        signInButton.layer.backgroundColor = UIColor.white.cgColor
    }

    
    //actions
    @IBAction func clickSignUpButton(_ sender: Any) {
        self.performSegue(withIdentifier: "SignUp", sender: self)
    }
    
    @IBAction func clickSignInButton(_ sender: Any) {
        self.performSegue(withIdentifier: "SignInView", sender: self)
    }
}

