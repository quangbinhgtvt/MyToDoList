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
        //add user image to left bar
        let userImage = UIImage(named: "ic_list")
        let imageView = UIImageView(image: userImage)
        let logo = UIBarButtonItem(image: userImage, style: UIBarButtonItem.Style.plain, target: self, action: nil)
//        self.navigationItem.title = " Phan Quang Binh"
        self.navigationItem.leftBarButtonItem = logo
    }

    //table func
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTableView.dequeueReusableCell(withIdentifier: "listCell") as! listTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    //actions
    @IBAction func clickCreateBtn(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let CreateListVC = sb.instantiateViewController(withIdentifier: "CreateListVC") as! CreateListViewController
        self.navigationController?.pushViewController(CreateListVC, animated: true)
    }
    
}
