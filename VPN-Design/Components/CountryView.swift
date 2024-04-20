//
//  CountryView.swift
//  VPN-Design
//
//  Created by PC on 20/04/2024.
//

import SwiftUI

struct CountryView: View {
    let isSelected: Bool
    let country: CountryModel
    let selectedHorizontalPadding: CGFloat
    
    var body: some View {
        HStack(spacing: 19) {
            Image(country.flag)
                .resizable()
                .scaledToFill()
                .frame(width: 33, height: 33)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .background{
                    RoundedRectangle(cornerRadius: 6)
                        .stroke()
                        .foregroundColor(.white)
                }
            
            VStack(alignment: .leading) {
                Text(country.name)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.white)
                Text("\(country.locations) Locations")
                    .font(.system(size: 11))
                    .foregroundStyle(.white)
            }
            Spacer()
            SignalStrengthView(strength: country.networkStrength, transferRate: country.transferRate)
        }
        .padding(.vertical, isSelected ? 22 : 10)
        .padding(.horizontal, selectedHorizontalPadding)
        .background{
            if isSelected {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(Color._8588FB.opacity(0.5))
            }
        }
    }
}

#Preview {
    CountryView(isSelected: true, country: CountryModel.freeCountries.first!, selectedHorizontalPadding: 23)
        .background(Color.gray)
}
