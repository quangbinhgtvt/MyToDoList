//
//  CompletedTableViewCell.swift
//  MyToDoList
//
//  Created by BinhPQ on 11/14/18.
//  Copyright © 2018 BinhPQ. All rights reserved.
//

import UIKit

class CompletedTableViewCell: UITableViewCell {

    @IBOutlet weak var showCompletedButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
