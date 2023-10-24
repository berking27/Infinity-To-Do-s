//
//  ProfileViewModel.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 28.08.2023.
//

import Foundation

class ProfileViewModel: ObservableObject{
     
     @Published var user: User? = nil
     
     func onAppear() {
          FirebaseManager.shared.fetchUser { user in
               guard let user = user else {
                    Log.error("User data can not fetched!")
                    return
               }
               Log.info("User Data Fetched")
               self.user = user
          }
     }
     
     @MainActor func signOutTapped(){
          FirebaseManager.shared.signOut()
          Log.info("Successfully sign out")
          AppState.shared.navigation = .login
     }
     
     
}
