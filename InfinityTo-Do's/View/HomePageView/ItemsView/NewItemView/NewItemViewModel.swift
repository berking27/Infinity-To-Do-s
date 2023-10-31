//
//  NewItemViewModel.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 16.10.2023.
//
import Foundation
import UIKit

class NewItemViewModel: ObservableObject{
     
     @Published var title = ""
     @Published var isDone = false
     @Published var showAlert = false
     
     
     func save(listId: String){
          guard canSave else{
               return
          }
          
          FirebaseManager.shared.saveItems(title: title, isDone: isDone, listId: listId)
     }
     var canSave: Bool{
          guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
               return false
          }
          
          return true
     }
}
