//
//  BackgroundModifier.swift
//  VPN-Design
//
//  Created by PC on 20/04/2024.
//

import SwiftUI

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background{
                Image(Assets.background)
                    .resizable()
                    .frame(height: UIScreen.main.bounds.height + 20)
                    .offset(y: -20)
                    .ignoresSafeArea()
                
                Image(Assets.map)
                    .resizable()
                    .scaledToFit()
                    .offset(y: -200)
            }
    }
}

