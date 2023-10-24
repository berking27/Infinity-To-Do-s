//
//  LoginView.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 23.08.2023.
//

import SwiftUI

struct LoginView: View {
     
     @StateObject var viewModel = LoginViewModel()
     
     var body: some View {
          ZStack {
               bgView()
               VStack(){
                    
                    Text("INFINITY TO-D∞")
                         .foregroundColor(.white)
                         .font(.largeTitle)
                         .bold()
                    
                    Group{
                         LoginViewCell(text: $viewModel.email, title: "Email", systemImage: "person.crop.circle")
                         
                         LoginViewCell(text: $viewModel.password, title: "Password", systemImage: "lock.circle",isSecureField: true)
                    }
                    
                    if viewModel.isLoading{
                         LoadingScreen()
                              .padding()
                    }else{
                         Button {
                              viewModel.loginTapped()
                         } label: {
                              Text("Login")
                                   .font(.title)
                                   .fontWeight(.semibold)
                                   .foregroundColor(.appNavyBlueColor)
                                   .padding(.vertical, 12)
                                   .padding(.horizontal, 20)
                                   .background(
                                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                                             .fill(Color.white)
                                   )
                         }
                         .padding(.top, 8)
                         .alert(isPresented: $viewModel.showWrongAlert) {
                              Alert(title: Text("Warning"),
                                    message: Text("Wrong email or password"),
                                    dismissButton:
                                        .default(Text("OK"))
                              )
                         }
                         .alert("Email or password field must be filled",isPresented: $viewModel.showAlert) {
                              Button("OK"){ }
                         }
                    }
               }
               
          }
     }
     private func bgView() -> some View{
          ZStack{
               Rectangle()
                    .trim(from: 0.0, to: 0.5)
                    .foregroundStyle(.linearGradient(colors: [Color.appOceanBlue, Color.appLightBlue], startPoint: .bottom, endPoint: .topLeading))
                    .frame(maxWidth: .infinity)
               Rectangle()
                    .trim(from: 0.5, to: 1.0)
                    .foregroundStyle(.linearGradient(colors: [.appLightBlue,.appOceanBlue], startPoint: .bottomLeading, endPoint: .top))
                    .frame(maxWidth: .infinity)
               
          }
          .ignoresSafeArea()
     }
}

struct LoginView_Previews: PreviewProvider {
     static var previews: some View {
          LoginView()
     }
}
