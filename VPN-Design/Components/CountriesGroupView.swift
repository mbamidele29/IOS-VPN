//
//  CountriesGroupView.swift
//  VPN-Design
//
//  Created by PC on 20/04/2024.
//

import SwiftUI

struct CountriesGroupView: View {
    let title: String
    let image: String
    let countries: [CountryModel]
    @EnvironmentObject var viewModel: CountryViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TitleView(title: title, image: image)
            
            ScrollView(showsIndicators: false) {
                ForEach(countries) {country in
                    CountryView(isSelected: viewModel.selectedCountry == country,
                                country: country, selectedHorizontalPadding: 13)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                viewModel.setCountry(country: country)
                            }
                        }
                }
                .padding(.bottom, 25)
            }
        }
        .padding(.horizontal, 10)
        .padding(.top, 25)
        .frame(maxHeight: 400)
        .modifier(CardModifier())
    }
}

@ViewBuilder private func TitleView(title: String, image: String) -> some View {
    HStack(spacing: 9) {
        Image(Assets.globe)
            .resizable()
            .scaledToFit()
            .frame(width: 24, height: 24)
        Text(title)
            .font(.system(size: 20))
            .foregroundStyle(.white)
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(width: 24, height: 24)
    }
}
