//
//  FirebaseManager.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 23.08.2023.
//

import Foundation
import Firebase
import FirebaseFirestore


class FirebaseManager: NetworkManagerProtocol{
     
     
     
     static let shared = FirebaseManager()
     
     let db = Firestore.firestore()
     
     @Published var userSession: FirebaseAuth.User?
     @Published var currentUser: User?
     @Published var errorMessage: Error?
     @Published var showErrorAlert: Bool = false

     
     private init(){
          self.userSession = Auth.auth().currentUser
     }
     
     func isThereAnyUser() -> Bool {
          Auth.auth().currentUser != nil
     }
     
     func signIn(withEmail email: String, password: String) async throws {
          
          
          do{
               let result = try await Auth.auth().signIn(withEmail: email, password: password)
               Log.info("Auth user completed with email and password")
               DispatchQueue.main.async {
                    self.userSession = result.user
               }
               
          } catch{
               Log.error("Failed to Log in")
               DispatchQueue.main.async {
                    self.errorMessage = error
                    self.showErrorAlert = true
               }
               
          }
          
     }
     
     func signOut() {
          do{
               try Auth.auth().signOut()
               self.userSession = nil
               self.currentUser = nil
          }catch{
               Log.error("Failed to sign out!!")
          }
          Log.info("User successfully Sign out")
     }
     
     func saveToDoS(title: String, isDone: Bool){
          
          //getCurrent user id
          guard let uid = FirebaseManager.shared.userSession?.uid else {
               return
          }
          
          //Create Model
          let newId = UUID().uuidString
          let newItem = ToDoListItem(id: newId
                                     ,title: title,
                                     isDone: false)
          
          //Save model
          db.collection("users")
               .document(uid)
               .collection("todos")
               .document(newId)
               .setData(newItem.asDictionary())
          
     }
     
//     func saveItems(title: String){
//          guard let uid = FirebaseManager.shared.currentUser?.id else{
//               return
//          }
//          let newId = UUID().uuidString
//          let newItem = ToDoListItem(id: newId,
//                                     title: title,
//                                     isDone: false)
//          
//          db.collection("users")
//               .document(uid)
//               .collection("todos")
//               .document("123")
//               .setData([String : Any])
//     }
     
     
     func fetchUser(completion: @escaping (User?) -> Void) {
 
     }
}

