//
//  PowerButtonView.swift
//  VPN-Design
//
//  Created by PC on 20/04/2024.
//

import SwiftUI

struct PowerButtonView: View {
    @EnvironmentObject var viewModel: CountryViewModel
    
    var body: some View {
        NavigationLink{
            CountriesView()
                .navigationBarBackButtonHidden()
        } label: {
            RoundedRectangle(cornerRadius: 219)
                .stroke()
                .frame(width: 219, height: 219)
                .foregroundStyle(Color._8588FB)
                .background{
                    RoundedRectangle(cornerRadius: 177)
                        .frame(width: 177, height: 177)
                        .foregroundStyle(Color._8588FB.opacity(0.22))
                    RoundedRectangle(cornerRadius: 143)
                        .frame(width: 143, height: 143)
                        .foregroundStyle(Color._8588FB)
                    Image(Assets.power)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                }
        }
    }
}

#Preview {
    PowerButtonView()
}
