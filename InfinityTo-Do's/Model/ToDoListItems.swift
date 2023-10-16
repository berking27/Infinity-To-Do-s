//
//  ToDoListItems.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 28.08.2023.
//

import Foundation

struct ToDoListItem: Codable, Identifiable{

     let id: String
     let title: String
     var isDone: Bool
     
     mutating func setDone(_ state: Bool){
          isDone = state
     }
}
