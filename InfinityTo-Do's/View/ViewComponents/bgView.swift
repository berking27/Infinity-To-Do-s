//
//  bgView.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 20.10.2023.
//

import Foundation
import SwiftUI

func LoginBgView() -> some View {
     ZStack{
          Rectangle()
               .trim(from: 0.0, to: 0.5)
               .foregroundStyle(.linearGradient(colors: [Color.appOceanBlue, Color.appLightBlue], startPoint: .bottom, endPoint: .topLeading))
               .frame(maxWidth: .infinity)
          Rectangle()
               .trim(from: 0.5, to: 1.0)
               .foregroundStyle(.linearGradient(colors: [.appLightBlue,.appOceanBlue], startPoint: .bottomLeading, endPoint: .top))
               .frame(maxWidth: .infinity)
          
     }
     .ignoresSafeArea()
}

func mainBgView() -> some View {
     ZStack{
          LinearGradient(gradient: Gradient(colors: [.appLightBlue, .appTeal, .appOceanBlue]), startPoint: .top, endPoint: .bottomTrailing)
               .ignoresSafeArea()
     }
}

