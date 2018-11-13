//
//  CreateListViewController.swift
//  MyToDoList
//
//  Created by BinhPQ on 11/9/18.
//  Copyright © 2018 BinhPQ. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class CreateListViewController: UIViewController {

    @IBOutlet weak var newListLbl: UITextField!
    @IBOutlet weak var subViewNewList: UIView!
    
    var db: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        customizeUI()
        db = Firestore.firestore()
        let settting = db.settings
        settting.areTimestampsInSnapshotsEnabled = true
        db.settings = settting
    }
    
    private func customizeUI(){
        //border of subview
        subViewNewList.layer.borderColor = UIColor.gray.cgColor
        subViewNewList.layer.borderWidth = 1
        //set delegate
        
    }
    
    //acitons
    @IBAction func clickCreateBtn(_ sender: Any) {
        guard let listName = newListLbl.text else {
            Alert(title: "Empty List Name", message: "Enter your list name")
            return
        }
        //get current user
        let user = Auth.auth().currentUser
        let userUid = user?.uid
        //create new collection, add documents
        var ref: DocumentReference? = nil
        ref = db.collection("Lists").addDocument(data: [
            "name": listName,
            "userUid": userUid as Any
        ]){
            error in
            if let _ = error {
                print("fail to write data")
            }
            else{
                print("success")
            }
          }
        self.navigationController?.popViewController(animated: true)
        
    }
    
    //inform message
    private func Alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction) in })
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
 
}
