//
//  CountriesView.swift
//  VPN-Design
//
//  Created by PC on 20/04/2024.
//

import SwiftUI

struct CountriesView: View {
    @EnvironmentObject var viewModel: CountryViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white, .font : UIFont.systemFont(ofSize: 18)]

    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 24){ 
                CountriesGroupView(title: "Free server", image: Assets.lockOpen, countries: viewModel.freeCountries)
                
                CountriesGroupView(title: "Fast server", image: Assets.lockClosed, countries: viewModel.premiumCountries)
                
                Spacer()
            }
            .navigationTitle("Select Country")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    IconButtonView(image: Assets.back) {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem {
                    IconButtonView(image: Assets.search) {}
                }
            }
            .padding()
            .modifier(BackgroundModifier())
        }
    }
}

#Preview {
    CountriesView()
        .environmentObject(CountryViewModel())
}
