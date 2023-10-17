//
//  AddNewToDoListView.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 28.08.2023.
//

import SwiftUI

struct AddNewToDoListView: View {
     
     @StateObject var viewModel = AddNewToDoListViewModel()
     @Binding var newToDoPresented: Bool
     
    var body: some View {
         ZStack {
              bgRect()
              VStack{
                   Text("New To-Do List")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                   
                   VStack{
                        Group{
                             HStack{
                                  TextField("To-Do Name", text: $viewModel.title)
                                       .foregroundColor(.white)
                                       .textFieldStyle(.plain)
                             }
                             
//                             ColorPicker("Color Picker",
//                                         selection: $viewModel.color,
//                                         supportsOpacity: false)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 20)
                        .background(Color.appDarkMint)
                        .cornerRadius(4)
                        
                        Button {
                             if viewModel.canSave{
                                  viewModel.save()
                                  newToDoPresented = false
                             } else{
                                  viewModel.showAlert = true
                             }
                        } label: {
                             Text("Add New To-Do-List")
                                  .foregroundColor(.white)
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 16)
                        .background(Color.appPurple)
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
               .foregroundStyle(.linearGradient(colors: [Color.appPurple,Color.black, Color.appPurple], startPoint: .top, endPoint: .bottom))
               .frame(maxWidth: .infinity)
               .ignoresSafeArea()

     }
}

struct AddNewToDoList_Previews: PreviewProvider {
    static var previews: some View {
         AddNewToDoListView(newToDoPresented: Binding(get: {
              return true
         }, set: { _ in
              
         }))
    }
}
