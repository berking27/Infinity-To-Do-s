//
//  LoginViewModel.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 23.08.2023.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject{
     
     @Published var password = ""
     @Published var email = ""
     
     @Published var isLoading: Bool = false
     @Published var showAlert: Bool = false
     @Published var showWrongAlert: Bool = false
     @Published var errorMessage: String = ""
     
     
     func loginTapped(){
          
          if email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || password.isEmpty {
               showAlert = true
               Log.warning("Email or password is empty")
               return
          }
          isLoading = true
          
          Task{
               do{
                    try await FirebaseManager.shared.signIn(withEmail: email, password: password)
                    DispatchQueue.main.async {
                         self.errorMessage = FirebaseManager.shared.errorMessage?.localizedDescription ?? ""
                         self.showWrongAlert = FirebaseManager.shared.showErrorAlert
                         
                         if FirebaseManager.shared.isThereAnyUser(){
                              AppState.shared.navigation = .home
                         }
                    }
               }
               catch{
                    Log.error("Error occurs at sign in")
               }
               DispatchQueue.main.async {
                    self.isLoading = false
               }
          }
     }
}
