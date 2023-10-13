//
//  ToDoListItemView.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 28.08.2023.
//

import SwiftUI

struct ToDoListItemView: View {
     
     @StateObject var viewModel = ToDoListItemViewModel()
     let item: ToDoListItem
     
    var body: some View {
         HStack{
              VStack{
                   Text(item.title)
                        .bold()
                        .font(.title2)
                        .foregroundColor(Color.appPurple)
              }
              Spacer()
              
              Button {
                   viewModel.toggle(item: item)
              } label: {
                   Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
              }

         }
         
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
         ToDoListItemView(item: .init(id: "123", title: "Get Milk", isDone: false))
    }
}
