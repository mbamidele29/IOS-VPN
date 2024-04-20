//
//  CountryViewModel.swift
//  VPN-Design
//
//  Created by PC on 20/04/2024.
//

import Combine
import Foundation

class CountryViewModel: ObservableObject {
    @Published private(set) var selectedCountry: CountryModel?
    let endDate = Calendar.current.date(byAdding: .minute, value: 30, to: Date.now)!
    
    @Published var freeCountries = [CountryModel]()
    @Published var premiumCountries = [CountryModel]()
    
    @Published var timeRemaining: String = "00:00"

    
    init() {
        self.freeCountries = CountryModel.freeCountries
        self.premiumCountries = CountryModel.premiumCountries
        
        if !freeCountries.isEmpty {
            selectedCountry = freeCountries.first
        }
    }
    
    func setCountry(country: CountryModel?) {
        selectedCountry = country
    }
    
    var hasCountdownCompleted: Bool {
        Date.now >= endDate
    }
    
    func updateTimer() {
        let calendar = Calendar(identifier: .gregorian)
    
        let timeValue = calendar.dateComponents([.day, .hour, .minute, .second], from: Date(), to: endDate)
        
        if !hasCountdownCompleted {
            let minute = timeValue.minute
            let second = timeValue.second
            
            var min = String(describing: minute!)
            var sec = String(describing: second!)
            
            if min.count == 1 {
                min = "0\(min)"
            }
            if sec.count == 1 {
                sec = "0\(sec)"
            }
            
            timeRemaining = "\(min):\(sec)"
        }
    }
}
