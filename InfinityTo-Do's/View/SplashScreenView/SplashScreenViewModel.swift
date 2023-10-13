//
//  SplashScreenViewModel.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 23.08.2023.
//

import Foundation



class SplashScreenViewModel: ObservableObject {

     func onAppear(){
          if FirebaseManager.shared.isThereAnyUser(){
               AppState.shared.navigation = .home
          }else{
               AppState.shared.navigation = .login
          }
          
     }
}
