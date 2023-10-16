//
//  HomePageViewModel.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 25.08.2023.
//

import Foundation

class HomePageViewModel: ObservableObject{
     
     @MainActor func signOutTapped(){
          FirebaseManager.shared.signOut()
          Log.info("Successfully sign out")
          AppState.shared.navigation = .login
     }
     
     func isSignedIn() -> Bool{
          return FirebaseManager.shared.isThereAnyUser()
     }
}
