//
//  LoadingScreen.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 28.08.2023.
//

import SwiftUI

struct LoadingScreen: View {
    @State private var isTapped = false
    @State private var isBigger = false
    
    var body: some View {
        VStack {
            Image(systemName: isTapped ? "infinity" : "plus")
                .font(.system(size: isBigger ? 50 * 1.3 : 50))
                .foregroundColor(.appDarkMint)
                .rotationEffect(.degrees(isTapped ? 180 : 0))
                .animation(
                    Animation.easeInOut(duration: 0.5)
                        .repeatCount(isTapped ? 1 : 0, autoreverses: true)
                )
                .onAppear() {
                    animateLoading()
                }
        }
    }
    
    private func animateLoading() {
        withAnimation {
            isTapped.toggle()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut(duration: 0.4)) {
                isBigger.toggle()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.easeInOut(duration: 0.1)) {
                    isBigger.toggle()
                    animateLoading()
                }
            }
        }
    }
}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen()
    }
}
