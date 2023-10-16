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
                             .foregroundColor(Color.black)
                   }
                   Spacer()
                   
                   Button {
                        viewModel.toggle(item: item)
                   } label: {
                        Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                             .foregroundColor(Color.appTeal)
                   }

              }
              .frame(maxWidth: .infinity)
              .padding(.horizontal, 16)
              .padding(.vertical, 4)
              .background(.regularMaterial)
              .cornerRadius(8)
              .padding(.horizontal, 4)
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
         ToDoListItemView(item: .init(id: "123", title: "Get Milk", isDone: false))
    }
}
