//
//  NavigationLazyView.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 26.10.2023.
//

import Foundation
import SwiftUI

struct NavigationLazyView<Content: View>: View {
     let build: () -> Content
     init(_ build: @autoclosure @escaping () -> Content) {
          self.build = build
     }
     var body: Content {
          build()
     }
}
