//
//  BackgroundModifier.swift
//  VPN-Design
//
//  Created by PC on 20/04/2024.
//

import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color._F6F6F6.opacity(0.15))
            .clipShape( RoundedRectangle(cornerRadius: 20))
            .background{
                RoundedRectangle(cornerRadius: 20)
                    .stroke()
                    .foregroundStyle(Color._8588FB)
            }
            .padding(.bottom, 16)
    }
}
