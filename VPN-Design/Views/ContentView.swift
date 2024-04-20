//
//  ContentView.swift
//  VPN-Design
//
//  Created by PC on 20/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State var completed: Bool = false
    @StateObject var viewModel = CountryViewModel()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private var hasCountdownCompleted: Bool {
        viewModel.hasCountdownCompleted
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Text("Free Time")
                        .font(.system(size: 32, weight: .semibold))
                        .foregroundStyle(.white)
                        .padding(.bottom, 12)
                    Text(viewModel.timeRemaining)
                        .font(.system(size: 20))
                        .foregroundStyle(.white)
                        .padding(.bottom, 12)
                }
                
                PowerButtonView()
                    .padding(.bottom, 12)
                
                    Button(action: {}, label: {
                        Text("Connected")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(.white.opacity(completed ? 0.5 : 1))
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                            .background(Color._1CB935.opacity(completed ? 0.5 : 1))
                            .clipShape(RoundedRectangle(cornerRadius: 56))
                    })
                    .padding(.bottom, 16)
                
                HStack{
                    UsageStatView(
                        image: Assets.upload,
                        name: "Upload",
                        value: "794 Kb/s")
                    
                    DottedLineView()
                                .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
                                .frame(width: 1, height: 80)
                                .foregroundStyle(.white)
                                .padding(.horizontal, 50)
                    UsageStatView(
                        image: Assets.download,
                        name: "Download",
                        value: "39 Mb/s")
                }
                .frame(width: 305, height: 128)
                .modifier(CardModifier())
                
                if viewModel.selectedCountry != nil {
                    CountryView(isSelected: true, country: viewModel.selectedCountry!, selectedHorizontalPadding: 23)
                        .padding(.horizontal, 40)
                }
                    
                Spacer()
                
               
            }
            .frame(width: UIScreen.main.bounds.width)
            .padding()
        .modifier(BackgroundModifier())
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                IconButtonView(image: Assets.category) {}
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 5) {
                Text("20% Off")
                    .font(.system(size: 13, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 3)
                    .background(Color._828BFA)
                    .cornerRadius(3)
                Image(Assets.bestSeller)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
            }
            }
        }
        }
        .onReceive(timer) { _ in
            if hasCountdownCompleted {
                completed = true
                timer.upstream.connect().cancel()
            } else {
                viewModel.updateTimer()
            }
        }
        
        .environmentObject(viewModel)
    }
}

#Preview {
    ContentView()
}
