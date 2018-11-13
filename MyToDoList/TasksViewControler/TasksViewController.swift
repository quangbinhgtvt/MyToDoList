//
//  TasksViewController.swift
//  MyToDoList
//
//  Created by Admin on 11/10/18.
//  Copyright © 2018 BinhPQ. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //outlets
    @IBOutlet weak var TasksTableView: UITableView!
    
    @IBOutlet weak var taskWillAdded: UITextField!
    
    //variable
    var listId: String?
    var doingTasks: [String] = []
    var completedTasks: [String] = []
    var db: Firestore!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        customizeTaskView()
        db = Firestore.firestore()
        let setting = db.settings
        setting.areTimestampsInSnapshotsEnabled = true
        db.settings = setting
        //get data
        getTasksData()
    }

    //customize
    private func customizeTaskView(){
        //register table cell
        self.TasksTableView.register(UINib(nibName: "TasksTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "TaskCell")
        //
        self.TasksTableView.delegate = self
        self.TasksTableView.dataSource = self
        //
        self.TasksTableView.separatorStyle = .none
    }
    
    //get data from firestore
    private func getTasksData(){
        
    }
    
    //table view func
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TasksTableView.dequeueReusableCell(withIdentifier: "TaskCell") as! TasksTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    //actions
    @IBAction func clickAddButton(_ sender: Any) {
        guard let taskName = taskWillAdded.text else {
            Alert(title: "Empty task", message: "Enter a valid task")
            return
        }
        
        var ref: DocumentReference? = nil
        ref = db.collection(TasksCollection.collectionName).addDocument(data: [
            TasksCollection.Documents.content : taskName,
            TasksCollection.Documents.listId : listId
        ]){
            error in
            if let error = error {
                print (error)
            } else{
                print(ref?.documentID)
            }
        }
        
    }
    
    //alert popup
    func Alert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: title, style: UIAlertAction.Style.default, handler: {(action) in})
        alert.addAction(okAction)
        present(alert, animated: true,completion: nil)
    }
    
}
