//
//  NewItemViewModel.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 16.10.2023.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation

class NewItemViewModel: ObservableObject{
     
     @Published var title = ""
     //     @Published var color: Color = .blue
     @Published var isDone = false
     @Published var showAlert = false
     
     
     func save(){
          guard canSave else{
               return
          }
          
          //Get current user id
          guard let uid = FirebaseManager.shared.currentUser?.id else{
               return
          }
          //Create Model
          let newId = UUID().uuidString
          let newItem = ToDoListItem(id: newId,
                                     title: title,
                                     isDone: false
          )

          //Save Model
          let db = Firestore.firestore()
          db.collection("users")
               .document(uid)
               .collection("todos")
               .document("123")
               .setData(newItem.asDictionary())
          
     }
     
     var canSave: Bool{
          guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
               return false
          }
          
          return true
     }
}
