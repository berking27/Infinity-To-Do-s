//
//  ItemsView.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 26.10.2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ItemsView: View {
     
     @State private var isTapped = false
     @StateObject var viewModel = ItemsViewModel()
     @FirestoreQuery var items: [ToDoListItem]
     @Environment(\.dismiss) var dismiss
     let listId: String
     
     init(userId: String, listId: String){
          self._items = FirestoreQuery(
               collectionPath: "users/\(userId)/todos/\(listId)/items"
          )
          
          self.listId = listId
          
          //Use this if NavigationBarTitle is with Large Font
          UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
          
          //Use this if NavigationBarTitle is with displayMode = .inline
          UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
     }
     
     var body: some View {
          NavigationView {
               ZStack{
                    mainBgView()
                    
                    VStack{
                         List{
                              ForEach(items, id: \.id) { item in
                                   ItemCellView(item: item, listId: listId)
                                        .swipeActions{
                                             Button(role: .destructive) {
                                                  withAnimation(.linear(duration: 0.4)){
                                                       viewModel.delete(id: item.id, listId: listId)
                                                  }
                                             } label :{
                                                  Label("Delete", systemImage: "trash")
                                             }
                                        }
                              }
                         }
                         .listStyle(PlainListStyle())
                    }
                    .navigationTitle("MY LIST")
                    .toolbar {
                         ToolbarItem(placement: .navigationBarTrailing){
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
                              .sheet(isPresented: $viewModel.showAddNewItem) {
                                   NewItemView(newItemPresented: $viewModel.showAddNewItem, listId: listId)
                              }
                         }
                         ToolbarItem(placement: .navigationBarLeading) {
                              Button {
                                   withAnimation {
                                        dismiss()
                                   }
                                   
                              } label: {
                                   Image(systemName: "arrow.left")
                                        .font(.system(size: 24))
                                        .foregroundColor(.black)
                              }
                         }
                    }
                    
               }
          }
          .navigationBarBackButtonHidden()
     }
}


#Preview {
     ItemsView(userId: "L2YxiXfwKzLcCNMKk9bAuSdDBzc2", listId: "F7157CFD-B279-4CBE-A118-E5BF3BAAB5A1")
}
