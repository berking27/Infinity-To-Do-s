//
//  View+NavigationBar.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 1.11.2023.
//

import SwiftUI
import UIKit

extension UINavigationController {
     
     // Remove back button text
     override open func viewWillLayoutSubviews() {
          let backButton = BackBarButtonItem(title: "", style: .plain, target: nil, action: nil)
          
          navigationBar.topItem?.backBarButtonItem = backButton
     }
}

final class BackBarButtonItem: UIBarButtonItem {
     @available(iOS 14.0, *)
     override var menu: UIMenu? {
          set {
               /* Don't set the menu here */
               /* super.menu = menu */
          }
          get {
               return super.menu
          }
     }
}
