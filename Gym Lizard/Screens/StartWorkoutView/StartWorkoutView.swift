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
    @State private var greeting = ""
    @State private var timeOfDayIcon = ""
    @State private var rotationAngle: Double = 0 // State variable to control the rotation angle of the sun in top right
    
    
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
                        .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                        .foregroundColor(.yellow) // Set the color as needed
                        .opacity(0.1) // Adjust the opacity as needed
                        .offset(x: geometry.size.width / 2, y: -geometry.size.height / 3) // Adjust the offset to position the symbol in the top right quarter
                        .rotationEffect(.degrees(rotationAngle), anchor: .center) // Rotate around the center
                        .onAppear {
                            withAnimation(Animation.linear(duration: 10).repeatForever(autoreverses: false)) {
                                // Animate the rotation
                                rotationAngle = 360
                            }
                        }
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
            timeOfDayIcon = "sun.max.fill"
            return "Good Morning"
        } else if hour >= 12 && hour < 17 {
            timeOfDayIcon = "sun.min"
            return "Good Afternoon"
        } else {
            timeOfDayIcon = "moonphase.waxing.crescent"
            return "Good Evening"
        }
    }
}

struct StartWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        StartWorkoutView()
    }
}
