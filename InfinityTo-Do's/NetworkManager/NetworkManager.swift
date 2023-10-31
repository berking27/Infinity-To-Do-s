//
//  NetworkManager.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 23.08.2023.
//

import Foundation

protocol NetworkManagerProtocol: ObservableObject{
     
     func signIn(withEmail email: String,password: String) async throws
     
     func signOut()
     
     func fetchUser(completion: @escaping (User?) -> Void)
     
     func saveToDoS(title: String)
     
     func saveItems(title: String, isDone: Bool, listId: String)
}
