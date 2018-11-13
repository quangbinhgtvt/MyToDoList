//
//  ListViewController.swift
//  MyToDoList
//
//  Created by BinhPQ on 11/6/18.
//  Copyright © 2018 BinhPQ. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ListViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    var email: String?
    var listContent = [List]()
    var db: Firestore!
    @IBOutlet weak var listTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        customizeListView()
        getListsContent()
        
    }
    
    //get current user's data from Firebase
    private func getListsContent(){
        //get current user Uid
        let user = Auth.auth().currentUser
        let userUid = user?.uid
        
       // get data

        db.collection(ListsCollection.collectionName).whereField(ListsCollection.Documents.userUid, isEqualTo: userUid).addSnapshotListener{
            (querySnapshot, error) in
            self.listContent.removeAll()
            guard let documents = querySnapshot?.documents else {
                print("khong lay duoc du lieu")
                return
            }
            for document in documents {
                var li = List()
                if let content = document.get(ListsCollection.Documents.content) {
                    li.content = content as! String
                    li.ListId = document.documentID
                }
                self.listContent.append(li)
            }
            DispatchQueue.main.async {
                self.listTableView.reloadData()
            }
        }
        
    }
    
    private func customizeListView()
    {
        //custom right bar button
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        self.listTableView.separatorStyle = .none
        
        
        //get instance of db Firestore
        db = Firestore.firestore()
        let settting = db.settings
        settting.areTimestampsInSnapshotsEnabled = true
        db.settings = settting
        
        self.listTableView.register(UINib(nibName:"listTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "listCell")
        //add user image to left bar
        let userImage = UIImage(named: "ic_list")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = userImage
        imageView.contentMode = .scaleAspectFit
        let logo = UIBarButtonItem(image: userImage, style: UIBarButtonItem.Style.plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = logo
        
    }

    //table func
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTableView.dequeueReusableCell(withIdentifier: "listCell") as! listTableViewCell
        cell.listContent.text  = listContent[indexPath.row].content
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tasksVC = TasksViewController(nibName: "TasksViewController", bundle: Bundle.main)
        tasksVC.listId = listContent[indexPath.row].ListId
        self.navigationController?.pushViewController(tasksVC, animated: true)
    }
    
    //actions
    @IBAction func clickCreateBtn(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let CreateListVC = sb.instantiateViewController(withIdentifier: "CreateListVC") as! CreateListViewController
        self.navigationController?.pushViewController(CreateListVC, animated: true)
    }
    
}
