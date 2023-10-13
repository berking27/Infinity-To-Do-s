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
                              .foregroundColor(.black)
                              .textFieldStyle(.plain)
                         Image(systemName: systemImage)
                              .imageScale(.large)
                              .foregroundColor(.black)
                    }else{
                         TextField(title, text: $text)
                              .foregroundColor(.black)
                              .textFieldStyle(.plain)
                         Image(systemName: systemImage)
                              .imageScale(.large)
                              .foregroundColor(.black)
                    }
               }
               .frame(maxWidth: .infinity)
               .padding(.horizontal, 40)
               .padding(.vertical, 20)
               .background(Color.appDarkMint)
               .cornerRadius(16)
          }
          .padding(.horizontal, 16)
     }
}

struct LoginViewCell_Previews: PreviewProvider {
    static var previews: some View {
         LoginViewCell(text: .constant(""), title: "Title", systemImage: "person.crop.circle")
    }
}
