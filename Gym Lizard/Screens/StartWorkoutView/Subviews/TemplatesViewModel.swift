//
//  TemplatesSubview.swift
//  Gym Lizard
//
//  Created by Gabriel Magallanes on 9/10/23.
//

import SwiftUI

struct TemplateView: View {
    let template: Template
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical){
                VStack(alignment: .leading, spacing: 8) {
                    Text(template.name)
                        .fontWeight(.bold)
                        .font(.title3)
                        .foregroundColor(Color(.label))
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(
                                    LinearGradient(gradient: Gradient(colors: [Color.orange, Color.green]), startPoint: .leading, endPoint: .trailing),
                                    lineWidth: 2
                                )
                        )
                    Text("Last Performed: \(template.lastPerformed)")
                        .font(.subheadline)
                    ForEach(template.workoutData.keys.sorted(), id: \.self) { workoutTitle in
                        HStack {
                            Text(workoutTitle)
                                .font(.subheadline)
                            Spacer()
                            Text("Sets: \(template.setsPerWorkout[workoutTitle] ?? 0)")
                                .font(.subheadline)
                        }
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .frame(minHeight: geometry.size.height) // Set the minimum height to the height of the available space
                .clipped() // Truncate content exceeding the maximum height
            }
        }
        .frame(height: 300) // Set the desired height for truncation
    }
}
struct TemplatesSubview_Previews: PreviewProvider {
    
    let templates = [MockData.sampleTemplatePushDay, MockData.sampleTemplatePullDay, MockData.sampleTemplateLegDay]
    
    static var previews: some View {
        TemplateView(template: MockData.sampleTemplateLegDay)
    }
}
