//
//  TemplateDetailView.swift
//  Gym Lizard
//
//  Created by Gabriel Magallanes on 9/10/23.
//

import SwiftUI

struct TemplateDetailView: View {
    
    var template: Template
    
    var body: some View {
        VStack {
            HStack{
                XDismissButton()
                    .padding(.leading, 5)
                    .frame(maxWidth: .infinity)
                
                Text(template.name)
                    .font(.title2)
                    .frame(maxWidth: .infinity)
                
                Button{
                    print("Edit button pressed")
                } label: {
                    Text("Edit")
                        .font(.title3)
                        .padding(.trailing)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            
            Text("Last performed: " + template.lastPerformed)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .foregroundColor(.gray)
            
            ScrollView {
                ForEach(MockData.sampleTemplatePushDay.workoutData.keys.sorted(), id: \.self) { workoutItem in
                    if let sets = MockData.sampleTemplatePushDay.workoutData[workoutItem] {
                        HStack {
                            Image(systemName: "dumbbell.fill")
                                .font(.title3)
                                .padding()
                            
                            Text("\(MockData.sampleTemplatePushDay.setsPerWorkout[workoutItem] ?? 0) sets")
                                .font(.subheadline)
                                .foregroundColor(.orange)
                            
                            Text(workoutItem)
                                .font(.title3)
                                .padding(.leading, 20)
                                .padding(.vertical, 10)
                                .truncationMode(.tail)
                                .lineLimit(1)
                            
                            Spacer()
                        }
                        .padding(.leading)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(
                                    LinearGradient(gradient: Gradient(colors: [Color.orange, Color.green]), startPoint: .leading, endPoint: .trailing),
                                    lineWidth: 2
                                )
                        )
                        .padding(.horizontal)
                    }
                }
                
            }
        }
        .frame(maxHeight: 300)
        
    }
}

struct TemplateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateDetailView(template: MockData.sampleTemplatePushDay)
    }
}
