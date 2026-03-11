//
        //
    //  Project: WeatherAppStitchSwiftUI
    //  File: ContentView.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Weather", systemImage: "cloud.sun.fill") {
                WeatherHomeView()
            }
            Tab("Explore", systemImage: "figure.walk") {
                WalkingPathView()
            }
        }
    }
}

#Preview {
    ContentView()
}
