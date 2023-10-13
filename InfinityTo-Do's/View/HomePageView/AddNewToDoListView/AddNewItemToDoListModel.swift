//
//  AddNewToDoListViewModel.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 28.08.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import SwiftUI


class AddNewToDoListViewModel: ObservableObject{
     
     @Published var title = ""
//     @Published var color: Color = .blue
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
