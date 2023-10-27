//
//  ToDoListCellView.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 27.10.2023.
//

import SwiftUI

struct ToDoListCellView: View {
     @StateObject var viewModel = ItemCellViewModel()
     let item: ToDoListItem
     
     var body: some View {
          
          HStack {
               
               VStack{
                    Text(item.title)
                         .font(.system(size: 20).bold())
                         .padding(.leading)
               }
               Spacer()
               
               Image(systemName: "arrow.right")
                    .padding(.trailing)
                    .font(.system(size: 20).bold())
          }
          .frame(maxWidth: .infinity)
          .padding(.horizontal, 4)
          .padding(.vertical, 16)
          .background(Color.white)
          .foregroundColor(.appNavyBlue)
          .cornerRadius(12)
          .padding([.leading, .bottom, .trailing], 9.0)
          
     }
}

#Preview {
     ToDoListCellView( item: .init(id: "123", title: "Get Milk", isDone: false))
}
