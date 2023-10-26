//
//  ColorExtension.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 23.08.2023.
//

import Foundation
import SwiftUI

extension Color{
     
     static let appPurple = Color("AppPurple")
     static let appDarkMint = Color("AppDarkMint")
     static let appLightMint = Color("AppLightMint")
     static let appTeal = Color("AppTeal")
     static let appDarkPurple = Color("AppDarkPurple")
     static let appOceanBlue = Color("AppOceanBlue")
     static let appLightBlue = Color("AppLightBlue")
     static let appNavyBlue = Color("AppNavyBlue")

}

extension Color {
  var uiColor: UIColor? {
    if #available(iOS 14.0, *) {
      return UIColor(self)
    } else {
      let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
      var hexNumber: UInt64 = 0
      var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
      let result = scanner.scanHexInt64(&hexNumber)
      if result {
        r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
        g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
        b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
        a = CGFloat(hexNumber & 0x000000ff) / 255
        return UIColor(red: r, green: g, blue: b, alpha: a)
      } else {
        return nil
      }
    }
  }
}
