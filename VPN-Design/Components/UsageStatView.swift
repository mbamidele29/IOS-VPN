//
//  UsageStatView.swift
//  VPN-Design
//
//  Created by PC on 20/04/2024.
//

import SwiftUI

struct UsageStatView: View {
    let image: String
    let name: String
    let value: String
    var body: some View {
        VStack(alignment: .leading){
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 44, height: 44)
                    .foregroundStyle(Color._8588FB)
                
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)

            }

            Text(name)
                .font(.system(size: 10, weight: .regular))
                .foregroundStyle(.white)
                .padding(.bottom, 3)
            Text(value)
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    UsageStatView(image: Assets.upload, name: "Upload", value: "794 Kb/s")
        .background(.black)
}
