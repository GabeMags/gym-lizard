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
    
    //The greeting at the top of the screen and the icon in top right
    @State private var greeting = "(N/A time) Hello!"
    @State private var timeOfDayIcon = "questionmark.app.dashed"
    @State private var timeOfDayColor = Color(.black)
    @State private var selectedTemplate: Template?
    @State private var isShowingDetailState = false
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    let templates = [MockData.sampleTemplatePushDay, MockData.sampleTemplatePullDay, MockData.sampleTemplateLegDay]
    
    var body: some View {
        ZStack {
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
                            
                            //Templates
                            VStack{
                                HStack {
                                    Text("Templates")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding()
                                        .font(.title2)
                                    
                                    Button(){
                                        print("New template pressed")
                                    } label: {
                                        Label("Template", systemImage: "plus")
                                    }
                                    .padding()
                                    .buttonStyle(.bordered)
                                    .controlSize(.small)
                                    .tint(.orange)
                                }
                                
                                LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                                    ForEach(templates) { template in
                                        TemplateView(template: template)
                                            .onTapGesture {
                                                selectedTemplate = template
                                                isShowingDetailState = true
                                            }
                                    }
                                }
                                .padding()
                            }
                            
                            Spacer()
                        }
                    }
                }
                .navigationTitle(greeting)
                .disabled(isShowingDetailState)
            }
            .onAppear {
                greeting = getGreeting()
            }
            .blur(radius: isShowingDetailState ? 20 : 0)
            
            if isShowingDetailState {
                TemplateDetailView(isShowingDetail: $isShowingDetailState, template: selectedTemplate!)
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
