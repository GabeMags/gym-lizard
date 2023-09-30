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
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title3)
                        .foregroundColor(Color(.label))
                        
                    Text("Last Performed: \(template.lastPerformed)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    ForEach(template.workoutData.keys.sorted(), id: \.self) { workoutTitle in
                        HStack {
                            Text("\(template.setsPerWorkout[workoutTitle] ?? 0) Sets")
                                .font(.subheadline)
                            Spacer()
                            Text(workoutTitle)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.subheadline)
                        }
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .frame(minHeight: geometry.size.height) // Set the minimum height to the height of the available space
                .clipped() // Truncate content exceeding the maximum height
            }
            .disabled(true)
        }
        .frame(height: 200) // Set the desired height for truncation
        .cornerRadius(15)
        .shadow(radius: 40)
    }
}
struct TemplatesSubview_Previews: PreviewProvider {
    
    let templates = [MockData.sampleTemplatePushDay, MockData.sampleTemplatePullDay, MockData.sampleTemplateLegDay]
    
    static var previews: some View {
        TemplateView(template: MockData.sampleTemplateLegDay)
    }
}
