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
         NavigationView{
              TabView {
                   ToDoListView(userId: FirebaseManager.shared.currentUser?.id ?? "")
                   .tabItem {
                        Label("To-Do",systemImage: "infinity")
                   }
                   
                   VStack{
                        Button {
                             viewModel.signOutTapped()
                        } label: {
                             Text("Sign Out")
                        }
                   }
                   .tabItem {
                        Label("Settings",systemImage: "gear")
                   }
                   
              }
         }
    }
}

//MARK: - Settings

private var settingsViewTabView: some View{
     ZStack{
          
     }
}


struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
