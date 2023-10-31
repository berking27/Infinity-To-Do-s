//
//  AddNewToDoListView.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 28.08.2023.
//

import SwiftUI

struct AddNewToDoListView: View {
     
     @StateObject var viewModel = AddNewToDoListViewModel()
     @Binding var newItemPresented: Bool
     
     
     
     var body: some View {
          ZStack {
               bgRect()
               VStack{
                    Text("Add New To Do's")
                         .font(.system(size: 40))
                         .foregroundColor(.white)
                         .bold()
                         .padding()
                    
                    VStack{
                         Group{
                              HStack{
                                   TextField("What To-Do", text: $viewModel.title)
                                        .foregroundColor(.white)
                                        .textFieldStyle(.plain)
                                        .font(.system(size: 16).bold())
                              }
                              
                         }
                         .frame(maxWidth: .infinity)
                         .padding(.horizontal, 40)
                         .padding(.vertical, 20)
                         .background(Color.appLightBlue.opacity(0.8))
                         .cornerRadius(4)
                         Button {
                              if viewModel.canSave{
                                   viewModel.save()
                                   newItemPresented = false
                              } else{
                                   viewModel.showAlert = true
                              }
                         } label: {
                              Text("Add New To Do's")
                                   .foregroundColor(.white)
                                   .bold()
                         }
                         .padding(.horizontal, 24)
                         .padding(.vertical, 16)
                         .background(Color.appNavyBlue)
                         .cornerRadius(8)
                         
                         
                    }
                    .padding(.horizontal, 16)
                    .padding()
               }
               .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Error"),
                          message: Text("Please Fill All fields"))
               }
          }
     }
     
     private func bgRect() -> some View{
          Rectangle()
               .foregroundStyle(.linearGradient(colors: [Color.appLightBlue,Color.black, Color.appLightBlue], startPoint: .top, endPoint: .bottom))
               .frame(maxWidth: .infinity)
               .ignoresSafeArea()
          
     }
}

#Preview {
     AddNewToDoListView(newItemPresented: Binding(get: {
          return true
     }, set: { _ in
          
     }))
}
