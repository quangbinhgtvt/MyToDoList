//
//  CompletedTableViewCell.swift
//  MyToDoList
//
//  Created by BinhPQ on 11/14/18.
//  Copyright © 2018 BinhPQ. All rights reserved.
//

import UIKit

typealias CompletedTableViewCellDidClick = () -> ()

class CompletedTableViewCell: UITableViewCell {

    @IBOutlet weak var showCompletedButton: UIButton!
    
    var didClickCallback : CompletedTableViewCellDidClick?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setDidClickCallback(callback : CompletedTableViewCellDidClick?) {
        self.didClickCallback = callback
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        showCompletedButton.addTarget(self, action: #selector(self.clickExpanding), for: .touchUpInside)

        // Configure the view for the selected state
    }
    
    @objc func clickExpanding() {
        didClickCallback?()
    }
    
}
