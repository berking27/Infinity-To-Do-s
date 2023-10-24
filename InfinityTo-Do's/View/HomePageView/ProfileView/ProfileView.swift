//
//  ProfileView.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 28.08.2023.
//

import SwiftUI

struct ProfileView: View {
     @StateObject var viewModel = ProfileViewModel()
     
     var body: some View {
          ZStack{
               
          NavigationView{
               VStack{
                    //   if let user = viewModel.user{
                    
                    Image(systemName: "person.circle")
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         .foregroundColor(.appDarkMint)
                         .frame(width: 125, height: 125)
                         .padding()
                    
                    
                    VStack(alignment: .leading){
                         HStack{
                              Text("Name:")
                                   .bold()
                              Text("Berkin KOCA")
                              //                                   Text("\(user.name)")
                         }
                         .padding()
                         HStack{
                              Text("Email:")
                                   .bold()
                              Text("berkinkoca@gmail.com")
                              //                                   Text("\(user.email)")
                         }
                         .padding()
                    }
                    
                    Button {
                         viewModel.signOutTapped()
                    } label: {
                         Text("Sign Out")
                              .font(.headline)
                              .foregroundColor(Color.white)
                              .padding(.vertical, 8)
                              .padding(.horizontal, 12)
                              .background(
                                   RoundedRectangle(cornerRadius: 20, style: .continuous)
                                        .fill(Color.red)
                              )
                    }
                    Spacer()
                    //                    }
                    //                    else{
                    //                         LoadingScreen()
                    //                              .onAppear{
                    //                                   viewModel.onAppear()
                    //                              }
                    //                    }
               }
               .navigationTitle("My Profile")
          }
     }
     }
}

struct ProfileView_Previews: PreviewProvider {
     static var previews: some View {
          ProfileView()
     }
}
