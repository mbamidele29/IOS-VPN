//
//  IconButtonView.swift
//  VPN-Design
//
//  Created by PC on 20/04/2024.
//

import SwiftUI

struct IconButtonView: View {
    let image: String
    let onPressed: () -> Void
    var body: some View {
        Button{
            onPressed()
        }
    label: {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .frame(width: 40, height: 40)
                .background(Color._828BFA)
            .clipShape(Circle())
        }
    }
}

#Preview {
    IconButtonView(image: Assets.category) {
        
    }
}
