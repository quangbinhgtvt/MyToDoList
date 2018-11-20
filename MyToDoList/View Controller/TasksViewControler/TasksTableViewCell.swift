//
//  TasksTableViewCell.swift
//  MyToDoList
//
//  Created by BinhPQ on 11/11/18.
//  Copyright © 2018 BinhPQ. All rights reserved.
//

import UIKit

typealias SelectedTickBoxDidClick = () -> ()
typealias FavoriteDidClick = () -> ()

class TasksTableViewCell: UITableViewCell {

   //outlets
    @IBOutlet weak var taskCellView: UIView!
    @IBOutlet weak var tickBoxButton: UIButton!
    @IBOutlet weak var taskContentLabel: UILabel!    
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    //variable
    
    var didClickTickBox: SelectedTickBoxDidClick?
    var didClickFavorite: FavoriteDidClick?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        customizeView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        tickBoxButton.addTarget(self, action: #selector(self.clickTickBox), for: .touchUpInside)
        favoriteButton.addTarget(self, action: #selector(self.clickFavorite), for: .touchUpInside)
    }
    //
    func setDidClickTickBox(callbackClickTickBox: SelectedTickBoxDidClick?) {
        self.didClickTickBox = callbackClickTickBox
    }
    
    func setDidClickFavorite(callbackClickFavorite: FavoriteDidClick?) {
        self.didClickFavorite = callbackClickFavorite
    }
    //customize UIview of tasks cell
    private func customizeView(){
        self.taskCellView.layer.borderColor = UIColor.gray.cgColor
        self.taskCellView.layer.borderWidth = 0.3
        
    }
    
    //event
    @objc func clickTickBox(){    
        didClickTickBox?()
    }
    
    @objc func clickFavorite(){
        didClickFavorite?()
    }
}
