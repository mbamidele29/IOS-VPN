//
//  CountryModel.swift
//  VPN-Design
//
//  Created by PC on 20/04/2024.
//

import Foundation


struct CountryModel: Identifiable, Hashable, Equatable {
    var id = UUID()
    let name: String
    let flag: String
    let locations: Int
    let networkStrength: Int
    let transferRate: String
    
    static func ==(lhs: CountryModel, rhs: CountryModel) -> Bool {
        return lhs.name == rhs.name
            && lhs.flag == rhs.flag
            && lhs.transferRate == rhs.transferRate
    }
}


extension CountryModel {
    static let freeCountries : [CountryModel] = [
        CountryModel(name: "Germany", flag: Assets.germany, locations: 9, networkStrength: 3, transferRate: "65 ms"),
        CountryModel(name: "Italy", flag: Assets.italy, locations: 4, networkStrength: 2, transferRate: "59 ms"),
        CountryModel(name: "Argentina", flag: Assets.argentina, locations: 8, networkStrength: 3, transferRate: "67 ms")
    ]
    
    
    static let premiumCountries : [CountryModel] = [
        CountryModel(name: "Brazil", flag: Assets.brazil, locations: 6, networkStrength: 4, transferRate: "120 ms"),
        CountryModel(name: "Finland", flag: Assets.finland, locations: 4, networkStrength: 4, transferRate: "160 ms"),
        CountryModel(name: "United States", flag: Assets.usa, locations: 3, networkStrength: 3, transferRate: "90 ms"),
        CountryModel(name: "Peru", flag: Assets.peru, locations: 8, networkStrength: 4, transferRate: "98 ms")
    ]
}
