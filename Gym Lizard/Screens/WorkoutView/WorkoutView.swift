//
//  WorkoutView.swift
//  Gym Lizard
//
//  Created by Gabriel Magallanes on 9/24/23.
//

import SwiftUI

struct WorkoutView: View {
    
    // The amount of time elapsed since the workout began
    @State private var timeElapsed: TimeInterval = 0.0
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    // The template passed in from the workout selection screen
    var template: Template
    
    var body: some View {
        
        // Calculate mins and sec from the time elapsed state
        let minutes = Int(timeElapsed) / 60
        let seconds = Int(timeElapsed) % 60
        
        // A way to evaluate the mock data at runtime
        let mockDataProperties: [(label: String?, value: Any)] = {
            let mirror = Mirror(reflecting: MockData.self)
            return Array(mirror.children)
        }()
        
        ScrollView{
            VStack {
                // The timer and finish button
                HStack {
                    // X button dismiss
                    HStack {
                        Button {
                            //                        isShowingDetail = false
                        } label: {
                            Image(systemName: "timer")
                                .foregroundColor(Color(.label))
                                .imageScale(.large)
                        }
                        .buttonStyle(.borderedProminent)
                        //                    .controlSize(.regular)
                        .foregroundColor(.black)
                        .tint(Color("buttonsLightGray"))
                        .padding()
                        
                        Spacer()
                    }
                    .padding(.leading, 5)
                    .frame(maxWidth: .infinity)
                    
                    // Finish workout button
                    Button(){
                        print("Finish workout pressed")
                    } label: {
                        Text("Finish")
                            .padding(.horizontal, 10)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.regular)
                    .foregroundColor(.black)
                    .tint(.orange)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding()
                }
                
                // Workout title
                Text(template.name)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                // Time elapsed in workout since the view appeared
                Text(String(format: "%d:%02d", minutes, seconds))
                    .onReceive(timer) { _ in
                        timeElapsed += 1.0
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                
                // The workout matrix
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(mockDataProperties, id: \.0) { (label, value) in
                        if let template = value as? Template {
                            TemplateView(template: template)
                        }
                    }
                }
                .padding()
                
            }
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(template: MockData.sampleTemplateLegDay)
    }
}
