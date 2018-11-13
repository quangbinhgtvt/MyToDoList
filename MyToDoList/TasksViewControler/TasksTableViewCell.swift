//
//  TasksTableViewCell.swift
//  MyToDoList
//
//  Created by BinhPQ on 11/11/18.
//  Copyright © 2018 BinhPQ. All rights reserved.
//

import UIKit

class TasksTableViewCell: UITableViewCell {

   //outlets
    @IBOutlet weak var taskCellView: UIView!
    @IBOutlet weak var tickBoxButton: UIButton!
    @IBOutlet weak var taskContentLabel: UILabel!    
    @IBOutlet weak var starButton: UIButton!
    
    //variable
    var isBoxTicked: Bool = false
    var isStarSelected: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        customizeView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //customize UIview of tasks cell
    private func customizeView(){
        self.taskCellView.layer.borderColor = UIColor.gray.cgColor
        self.taskCellView.layer.borderWidth = 0.3
        
    }
}
