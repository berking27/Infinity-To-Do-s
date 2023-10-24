//
//  NewItemView.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 16.10.2023.
//

import SwiftUI

struct NewItemView: View {
     
     @StateObject var viewModel = NewItemViewModel()
     @Binding var newItemPresented: Bool
     
     
     var body: some View {
          ZStack {
               bgRect()
               VStack{
                    Text("Add New Item")
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
                              
                              //                             ColorPicker("Color Picker",
                              //                                         selection: $viewModel.color,
                              //                                         supportsOpacity: false)
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
                              Text("Add New Item")
                                   .foregroundColor(.white)
                                   .bold()
                         }
                         .padding(.horizontal, 24)
                         .padding(.vertical, 16)
                         .background(Color.appNavyBlueColor)
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
     NewItemView(newItemPresented: Binding(get: {
          return true
     }, set: { _ in
          
     }))
}
