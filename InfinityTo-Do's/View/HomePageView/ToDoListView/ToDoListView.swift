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
          //Use this if NavigationBarTitle is with Large Font
          UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]

          //Use this if NavigationBarTitle is with displayMode = .inline
          UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
     }
     var body: some View {
          NavigationView {
               ZStack{
                    MainBgView()
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
                                   .foregroundColor(.white)
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
func MainBgView() -> some View{
     ZStack{
          Rectangle()
               .foregroundStyle(.linearGradient(colors: [.appLightBlue,.appTeal,.appOceanBlue], startPoint: .top, endPoint: .bottomTrailing))
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


