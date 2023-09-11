//
//  ContentView.swift
//  Gym Lizard
//
//  Created by Gabriel Magallanes on 9/4/23.
//

import SwiftUI

struct GymLizardTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            StartWorkoutView()
                .tabItem {
                    Image(systemName: "play.fill")
                    Text("Start Workout")
                }
            HistoryView()
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("History")
                }
        }
        .accentColor(Color("brandPrimary"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GymLizardTabView()
    }
}
