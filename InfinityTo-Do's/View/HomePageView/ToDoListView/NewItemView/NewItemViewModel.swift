//
//  NewItemViewModel.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 16.10.2023.
//
import Foundation

class NewItemViewModel: ObservableObject{
     
     @Published var title = ""
     @Published var isDone = false
     @Published var showAlert = false
          
     func save(){
          guard canSave else{
               return
          }
          
          FirebaseManager.shared.saveToDoS(title: title, isDone: isDone)
     }
     var canSave: Bool{
          guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
               return false
          }
          
          return true
     }
}
