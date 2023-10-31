//
//  ItemCellView.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 28.08.2023.
//

import SwiftUI

struct ItemCellView: View {
     
     @StateObject var viewModel = ItemCellViewModel()
     let item: ToDoListItem
     let listId: String
     
     var body: some View {
          HStack{
               Button {
                    viewModel.toggle(item: item,listId: listId)
               } label: {
                    Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                         .font(.system(size: 24).bold())
               }
               
               VStack{
                    Text(item.title)
                         .bold()
                         .font(.title2)
                         .foregroundColor(.white)
               }
               Spacer()

          }
          .frame(maxWidth: .infinity)
          .cornerRadius(8)
          .padding(.horizontal, 4)
          .listRowBackground(Color.clear)
          .foregroundColor(.black)
     }
}

struct ToDoListItemView_Previews: PreviewProvider {
     static var previews: some View {
          ItemCellView(item: .init(id: "123", title: "Get Milk", isDone: false), listId: "")
     }
}
