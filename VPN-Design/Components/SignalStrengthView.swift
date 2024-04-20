//
//  SignalStrengthView.swift
//  VPN-Design
//
//  Created by PC on 20/04/2024.
//

import SwiftUI

struct SignalStrengthView: View {
    let strength: Int
    let transferRate: String
    
    let maxStrength = 4
    var body: some View {
        HStack(spacing: 7) {
            HStack(alignment: .bottom, spacing: 1) {
                ForEach(0..<maxStrength, id: \.self){ index in

                    RoundedRectangle(cornerRadius: 1.5)
                        .frame(width: 4, height: 5 + (1.5 * CGFloat(index)))
                        .foregroundStyle(index+1 <= strength ? .white : Color._A1A1A1)
                }
            }
            Text(transferRate)
                .font(.system(size: 11))
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    SignalStrengthView(strength: 3, transferRate: "65 ms")
        .background(.red)
}
