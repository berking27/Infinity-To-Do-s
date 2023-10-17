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
          self._items = FirestoreQuery(
               collectionPath: "users/\(userId)/todos"
          )
     }
     //Git version Control Test
     var body: some View {
          NavigationView {
               ZStack{
                    bgView()
                    VStack{
                         List{
                              ForEach(items, id: \.id) { item in
                                   ToDoListItemView(item: item)
                                        .swipeActions{
                                             Button(role: .destructive) {
                                                  withAnimation(.linear(duration: 0.4)){
                                                       viewModel.delete(id: item.id)
                                                  }
                                             } label :{
                                                  Label("Delete", systemImage: "trash")
                                             }
                                        }
                              }
                         }
                         .listStyle(PlainListStyle())
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
                         NewItemView(newItemPresented: $viewModel.showAddNewItem)
                    }
               }
          }
          
     }
}

private func bgView() -> some View{
     ZStack{
          Rectangle()
               .foregroundStyle(.linearGradient(colors: [Color.appLightMint,Color.appPurple], startPoint: .bottomLeading, endPoint: .top))
               .frame(maxWidth: .infinity)
               .ignoresSafeArea()
     }
     .ignoresSafeArea()
}




struct ToDoListView_Previews: PreviewProvider {
     static var previews: some View {
          ToDoListView(userId: "L2YxiXfwKzLcCNMKk9bAuSdDBzc2")
     }
}


