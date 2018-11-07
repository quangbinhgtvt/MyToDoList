//
//  ListViewController.swift
//  MyToDoList
//
//  Created by BinhPQ on 11/6/18.
//  Copyright © 2018 BinhPQ. All rights reserved.
//

import UIKit

class ListViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    var email: String?
    @IBOutlet weak var listTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        customizeListView()
    }
    
    private func customizeListView()
    {
        //custom right bar button
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        self.listTableView.separatorStyle = .none
        
        self.listTableView.register(UINib(nibName:"listTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "listCell")
        
    }

    //table func
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTableView.dequeueReusableCell(withIdentifier: "listCell") as! listTableViewCell
        return cell
    }
}
