//
//  AddNewToDoListViewModel.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 28.08.2023.
//

import Foundation

class AddNewToDoListViewModel: ObservableObject{
     
     @Published var title = ""
     @Published var isDone = false
     @Published var showAlert = false
     
     
     func save(){
          guard canSave else{
               return
          }
          
          FirebaseManager.shared.saveToDoS(title: title)
               
     }
     
     var canSave: Bool{
          guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
               return false
          }
          
          return true
     }
}
