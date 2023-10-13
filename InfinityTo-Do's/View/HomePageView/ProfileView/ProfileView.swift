//
//  ProfileView.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 28.08.2023.
//

import SwiftUI

struct ProfileView: View {
     @StateObject var viewModel = ProfileViewModel()
     
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
