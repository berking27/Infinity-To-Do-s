//
//  bgView.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 20.10.2023.
//

import Foundation
import SwiftUI

func LoginBgView() -> some View{
     ZStack{
          Rectangle()
               .trim(from: 0.0, to: 0.5)
               .foregroundStyle(.linearGradient(colors: [Color.appPurple, Color.appLightMint], startPoint: .bottom, endPoint: .topLeading))
               .frame(maxWidth: .infinity)
          Rectangle()
               .trim(from: 0.5, to: 1.0)
               .foregroundStyle(.linearGradient(colors: [Color.appLightMint,Color.appPurple], startPoint: .bottomLeading, endPoint: .top))
               .frame(maxWidth: .infinity)
               
     }
     .ignoresSafeArea()
}


//func MainBgView() -> some View{
//     ZStack{
//          Rectangle()
//               .foregroundStyle(.linearGradient(colors: [Color.appLightMint,Color.appPurple], startPoint: .bottomLeading, endPoint: .top))
//               .frame(maxWidth: .infinity)
//               .ignoresSafeArea()
//     }
//     .ignoresSafeArea()
//}
