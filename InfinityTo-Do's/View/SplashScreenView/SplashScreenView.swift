//
//  SplashScreenView.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 23.08.2023.
//

import SwiftUI

struct SplashScreenView: View {
     
          @StateObject var viewModel = SplashScreenViewModel()
     
     @State private var trimFrom1 = 0.0
     @State private var trimFrom2 = 0.5
     @State private var trimTo1 = 0.5
     @State private var trimTo2 = 1.0
     
     var body: some View {
          
          ZStack{
               Rectangle()
                    .foregroundStyle(.linearGradient(colors: [Color.white, Color.appNavyBlueColor], startPoint: .top, endPoint: .bottom))
                    .ignoresSafeArea()
               VStack{
                    Group{
                         Text("Infinity To-Do")
                              .font(.largeTitle)
                         Image(systemName: "infinity")
                              .font(.system(size: 240))
                              
                    }
                    .foregroundColor(.appNavyBlueColor)
                    Spacer()
               }
               
               
               
               Rectangle()
                    .trim(from: trimFrom1, to: trimTo1)
                    .foregroundStyle(.linearGradient(colors: [Color.appLightBlue, Color.appOceanBlue], startPoint: .bottom, endPoint: .topLeading))
                    .frame(maxWidth: .infinity)
                    .ignoresSafeArea()
                    .onAppear{
                         withAnimation(.easeInOut(duration: 2.0)){
                              self.trimTo1 = 1.0
                              self.trimFrom1 = 0.5
                         }
                    }
               
               Rectangle()
                    .trim(from: trimFrom2, to: trimTo2)
                    .foregroundStyle(.linearGradient(colors: [Color.appOceanBlue,Color.appLightBlue], startPoint: .bottomLeading, endPoint: .top))
                    .frame(maxWidth: .infinity)
                    .ignoresSafeArea()
                    .onAppear{
                         withAnimation(.easeInOut(duration: 1.6)){
                              self.trimTo2 = 0.5
                              self.trimFrom2 = 0.0
                         }
                    }
          }
          .onAppear{
               DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    viewModel.onAppear()
               }
          }
     }
     
}


struct SplashScreenView_Previews: PreviewProvider {
     static var previews: some View {
          SplashScreenView()
               .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
               .previewDisplayName("iPhone 14 Pro")
          
          SplashScreenView()
               .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
               .previewDisplayName("iPhone SE")
     }
}
