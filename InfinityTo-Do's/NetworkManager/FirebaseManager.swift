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
     
     func deleteItems(id: String){
          guard let userId = userSession?.uid else{
               Log.error("NO USER IF FOUND!")
               return
          }
          db.collection("users")
              .document(userId)
              .collection("todos")
              .document(id)
              .delete()
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
     
     func toggleToDos(itemCopy: ToDoListItem){
          guard let uid = userSession?.uid else{
               return
          }
          db.collection("users")
               .document(uid)
               .collection("todos")
               .document(itemCopy.id)
               .setData(itemCopy.asDictionary())
     }
     
     func fetchUser(completion: @escaping (User?) -> Void) {
          guard let uid = userSession?.uid else {
               completion(nil)
               return
          }
          
          db.collection("users").document(uid).getDocument { snapshot, error in
               if error != nil {
                    Log.error("Failed to fetch user data")
                    completion(nil)
                    return
               }
               
               guard let data = snapshot?.data() else {
                    completion(nil)
                    return
               }
               
               let uid = data["uid"] as? String ?? ""
               let email = data["email"] as? String ?? ""
               let name = data["name"] as? String ?? ""
               
               let user = User(id: uid, email: email, name: name)
               completion(user)
               Log.info("Completion done fetching user data")
          }
     }
}

