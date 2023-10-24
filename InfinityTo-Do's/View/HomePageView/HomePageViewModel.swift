//
//  HomePageViewModel.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 25.08.2023.
//

import Foundation

class HomePageViewModel: ObservableObject{
     
     func isSignedIn() -> Bool{
          return FirebaseManager.shared.isThereAnyUser()
     }
}
