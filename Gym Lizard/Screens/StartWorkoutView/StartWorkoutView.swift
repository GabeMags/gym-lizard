//
//  StartWorkoutView.swift
//  Gym Lizard
//
//  Created by Gabriel Magallanes on 9/10/23.
//

import SwiftUI

struct Templates: Codable {
    var title: String
    var workouts: [String]
}

struct StartWorkoutView: View {
    
    //Good morning, good afternoon, etc
    @State private var greeting = "Unknown time. Hello!"
    @State private var timeOfDayIcon = "questionmark.app.dashed"
    @State private var timeOfDayColor = Color(.black)
    
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    
    
    var body: some View {
        
        
        NavigationView {
            ZStack {
                // Create a GeometryReader to get the size of the screen
                GeometryReader { geometry in
                    // Create a background circle using an SF Symbol
                    Image(systemName: timeOfDayIcon)
                        .resizable()
                        .frame(width: geometry.size.width / 1.5, height: geometry.size.height / 2.5)
                        .foregroundColor(timeOfDayColor)
                        .opacity(0.2) // Adjust the opacity as needed
                        .offset(x: geometry.size.width / 2.5, y: -geometry.size.height / 4.5) // Adjust the offset to position the symbol in the top right quarter
                }
                
                ScrollView {
                    VStack (alignment: .leading){
                        
                        QuickstartSubview()
                        
                        TemplatesSubview()
                        
                        LazyVGrid(columns: columns) {
                        }
                        Spacer()
                    }
                }
                .navigationTitle(greeting)
                .onAppear {
                    greeting = getGreeting()
                }
            }
        }
    }
    
    //Returns salutation based on the time
    func getGreeting() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        
        if hour >= 0 && hour < 12 {
            timeOfDayIcon = "sun.min"
            timeOfDayColor = Color(.yellow)
            return "Good Morning"
        } else if hour >= 12 && hour < 17 {
            timeOfDayIcon = "sun.max"
            timeOfDayColor = Color(.orange)
            return "Good Afternoon"
        } else {
            timeOfDayIcon = "moon.stars"
            timeOfDayColor = Color(.lightGray)
            return "Good Evening"
        }
    }
}

struct StartWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        StartWorkoutView()
    }
}
