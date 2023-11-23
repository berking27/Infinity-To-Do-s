//
//  AppState.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 23.08.2023.
//

import SwiftUI

final class AppState: ObservableObject {
    enum Navigation {
        case splash, login, home
    }

    @Published var navigation: Navigation = .splash
    static let shared = AppState()

    private init() {}
}

/*
 Branch Testing!!!
 21314
 1231412
 */
