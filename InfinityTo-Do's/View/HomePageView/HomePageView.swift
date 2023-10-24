//
//  HomePageView.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 23.08.2023.
//

import SwiftUI

struct HomePageView: View {
     
     @StateObject var viewModel = HomePageViewModel()
     
    var body: some View {
         if viewModel.isSignedIn(){
              NavigationView{
                   TabView {
                        if let userId = FirebaseManager.shared.userSession?.uid{
                             ToDoListView(userId: userId)
                                  .tabItem {
                                       Label("To-Do",systemImage: "infinity")
                                  }
                             VStack{
                              ProfileView()
                             }
                             .tabItem {
                                  Label("Settings",systemImage: "gear")
                             }
                             
                        }
                   }
                   .tabViewStyle(backgroundColor: .white,
                                 itemColor: .black,
                                 selectedItemColor: .appNavyBlueColor,
                                 badgeColor: .red)
                   
              }
         } else {
              LoginView()
         }
    }
}


struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
