//
//  FirebaseConstant.swift
//  MyToDoList
//
//  Created by Admin on 11/10/18.
//  Copyright © 2018 BinhPQ. All rights reserved.
//

import Foundation

struct ListsCollection {
    static let collectionName = "Lists"
    
    struct Documents {
        static let content = "name"
        static let userUid = "userUid"
    }
    
}

struct TasksCollection {
    static let collectionName = "Tasks"
    
    struct  Documents {
        static let content = "name"
        static let listId = "listId"
        
    }
}
