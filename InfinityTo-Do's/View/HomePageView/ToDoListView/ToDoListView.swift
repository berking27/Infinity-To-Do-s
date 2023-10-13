//
//  ToDoListView.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 28.08.2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
     
     @State private var isTapped = false
     @StateObject var viewModel = ToDoListViewModel()
     @FirestoreQuery var items: [ToDoListItem]
     
     
     init(userId: String){
          self._items = FirestoreQuery(collectionPath: "users\(userId)todos")
     }
     
     var body: some View {
          NavigationView {
               
               VStack{
                    List(items){ item in
                     ToDoListItemView(item: item)
                              .swipeActions {
                                   Button("Delete"){
                                        viewModel.delete(id: item.id)
                                   }
                                   .background(Color.red)

                              }
                    }
                    .listStyle(PlainListStyle())
                    .background(
                         Rectangle()
                              .foregroundStyle(.linearGradient(colors: [Color.appLightMint,Color.appPurple], startPoint: .bottomLeading, endPoint: .top))
                              .frame(maxWidth: .infinity)
                              .ignoresSafeArea()
                    )
               }
               .navigationTitle("To-Do-List")
               .toolbar {
                    Button {
                         withAnimation {
                             isTapped.toggle()
                         }
                         DispatchQueue.main.async {
                              viewModel.showAddNewItem = true
                         }
                    } label: {
                         Image(systemName: isTapped ? "plus" : "infinity")
                             .font(.system(size: 32))
                             .foregroundColor(.black)
                             .padding()
                             .rotationEffect(.degrees(isTapped ? 0 : 180))
                    }
               }
               .sheet(isPresented: $viewModel.showAddNewItem) {
                    AddNewToDoListView(newToDoPresented: $viewModel.showAddNewItem)
               }
          }
     }
}

struct ToDoListView_Previews: PreviewProvider {
     static var previews: some View {
          ToDoListView(userId: "")
     }
}


