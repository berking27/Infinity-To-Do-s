//
//  ToDoListView.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 28.08.2023.
//

import SwiftUI
import FirebaseFirestoreSwift

let navBarAppearence = UINavigationBarAppearance()

struct ToDoListView: View {
     
     @State private var isTapped = false
     @StateObject var viewModel = ToDoListViewModel()
     @FirestoreQuery var items: [ToDoLists]
     
     init(userId: String){
          self._items = FirestoreQuery(
               collectionPath: "users/\(userId)/todos"
          )
          //MARK: - navBarAppearence
          UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.black]
          UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
          
     }
     var body: some View {
          NavigationView {
               ZStack{
                    mainBgView()
                    ScrollView{
                         VStack{
                              ForEach(items, id: \.id) { item in
                                   if let userId = FirebaseManager.shared.userSession?.uid{
                                        NavigationLink(destination: ItemsView(userId: userId, listId: item.id)) {
                                             ToDoListCellView(item: item)
                                        }
                                   }
                              }
                              Spacer()
                         }
                         .padding(.top)
                         //This title will change depends on the name of list
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
                              AddNewToDoListView(newItemPresented: $viewModel.showAddNewItem)
                         }
                    }
               }
          }
     }
}



struct ToDoListView_Previews: PreviewProvider {
     static var previews: some View {
          ToDoListView(userId: "L2YxiXfwKzLcCNMKk9bAuSdDBzc2")
     }
}


