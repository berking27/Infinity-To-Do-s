//
//  ItemCellViewModel.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 29.08.2023.
//

import Foundation


class ItemCellViewModel: ObservableObject{
     init() {}
     
     func toggle(item: ToDoListItem){
          var itemCopy = item
          itemCopy.setDone(!item.isDone)
          
          FirebaseManager.shared.toggleToDos(itemCopy: itemCopy)
     }
     
}
