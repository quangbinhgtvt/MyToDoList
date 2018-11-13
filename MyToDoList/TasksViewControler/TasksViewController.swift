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
    var doingTasks: [Tasks] = []
    var completedTasks: [Tasks] = []
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
        print(listId)
    }

    //customize
    private func customizeTaskView(){
        //register table cell
        self.TasksTableView.register(UINib(nibName: "TasksTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "TaskCell")
        self.TasksTableView.register(UINib(nibName: "CompletedTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "CompletedCell")
        //
        self.TasksTableView.delegate = self
        self.TasksTableView.dataSource = self
        //
        self.TasksTableView.separatorStyle = .none
    }
    
    //get data from firestore
    private func getTasksData(){
        //get data
        db.collection(TasksCollection.collectionName).whereField(TasksCollection.Documents.listId, isEqualTo: listId).addSnapshotListener{ (querySnapShot, error) in
            self.doingTasks.removeAll()
            self.completedTasks.removeAll()
            guard let tasks = querySnapShot?.documents else {
                print("khong lay duoc du lieu")
                return
            }
            
            for task in tasks {
                var ta = Tasks()
                if let content = task.get(TasksCollection.Documents.content) {
                    ta.content = content as! String
                    ta.listId = task.documentID
                    self.doingTasks.append(ta)
                    
                }else
                {
                    print("khong co field content")
                }
                
            }
            print("tasks is: \(self.doingTasks)")
            
            DispatchQueue.main.async {
                self.TasksTableView.reloadData()
            }
        }
    }
    
    //table view func
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return doingTasks.count
        case 1:
            return 1
        default:
            return completedTasks.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch  indexPath.section {
        case 0:
            let cell = TasksTableView.dequeueReusableCell(withIdentifier: "TaskCell") as! TasksTableViewCell
            cell.taskContentLabel.text = doingTasks[indexPath.row].content
            return cell
        case 1:
            let cell = TasksTableView.dequeueReusableCell(withIdentifier: "CompletedCell") as! CompletedTableViewCell
            return cell        
        default:
            let cell = TasksTableView.dequeueReusableCell(withIdentifier: "TaskCell") as! TasksTableViewCell
            cell.taskContentLabel.text = completedTasks[indexPath.row].content
            return cell
        }
        
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
                //print(ref?.documentID)
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
