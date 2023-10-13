//
//  RootView.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 23.08.2023.
//

import SwiftUI

struct RootView: View {
     
     @EnvironmentObject var appState: AppState
     
    var body: some View {
         switch appState.navigation{
         case .splash:
              SplashScreenView()
                   .transition(.opacity)
         case .login:
              LoginView()
                   .transition(.opacity)
         case .home:
              HomePageView()
                   .transition(.opacity)
         }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
