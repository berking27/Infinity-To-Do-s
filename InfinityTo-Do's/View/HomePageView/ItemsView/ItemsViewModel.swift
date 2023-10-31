//
//  ItemsViewModel.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 26.10.2023.
//

import Foundation

class ItemsViewModel: ObservableObject{
     
     @Published var showAddNewItem = false
     
     init() {}
     
     func delete(id: String, listId: String){
          FirebaseManager.shared.deleteItems(id: id, listId: listId)
     }
     
}
