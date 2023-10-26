//
//  LoginViewCell.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 23.08.2023.
//

import SwiftUI

struct LoginViewCell: View {
     @Binding var text: String
     let title: String
     let systemImage: String
     var isSecureField = false
     @State private var email = ""
     @State private var password = ""
     
     
     var body: some View {
          
          VStack{
               HStack{
                    if isSecureField{
                         SecureField(title, text: $text)
                              .foregroundColor(.appNavyBlue)
                              .textFieldStyle(.plain)
                              .autocapitalization(.none)
                         Image(systemName: systemImage)
                              .imageScale(.large)
                              .foregroundColor(.appDarkPurple)
                    }else{
                         TextField(title, text: $text)
                              .foregroundColor(.appNavyBlue)
                              .textFieldStyle(.plain)
                              .autocapitalization(.none)
                         Image(systemName: systemImage)
                              .imageScale(.large)
                              .foregroundColor(.appDarkPurple)
                    }
               }
               .frame(maxWidth: .infinity)
               .foregroundColor(.purple)
               .padding(.horizontal, 12)
               .padding(.vertical, 16)
               .background(Color.white)
               .cornerRadius(4)
          }
          .padding(.horizontal, 12)
     }
}

struct LoginViewCell_Previews: PreviewProvider {
    static var previews: some View {
         LoginViewCell(text: .constant(""), title: "Title", systemImage: "person.crop.circle")
    }
}
