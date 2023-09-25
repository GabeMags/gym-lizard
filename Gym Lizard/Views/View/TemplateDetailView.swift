//
//  TemplateDetailView.swift
//  Gym Lizard
//
//  Created by Gabriel Magallanes on 9/10/23.
//

import SwiftUI

struct TemplateDetailView: View {
    
    @Binding var isShowingDetail: Bool
    
    var template: Template
    
    var body: some View {
        VStack {
            VStack {
                HStack{
                    // X button dismiss
                    HStack {
                        Button {
                            isShowingDetail = false
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(Color(.label))
                                .imageScale(.medium)
                                .frame(width: 44, height: 44)
                        }
                        Spacer()
                    }
                    .padding(.leading, 5)
                    .frame(maxWidth: .infinity)
                    
                    // Title
                    Text(template.name)
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                    
                    // Edit button
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
                                    .padding(.leading, 10)
                                    .padding(.vertical, 0.5)
                                    .truncationMode(.tail)
                                    .lineLimit(1)
                                
                                Spacer()
                            }
                            .padding(.leading)
                            .padding(.horizontal)
                        }
                    }
                    
                }
            }
            .frame(maxHeight: 450)
        }
        .frame(width: 350)
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(radius: 40)
    }
    
}

struct TemplateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateDetailView(isShowingDetail: .constant(true),
                           template: MockData.sampleTemplatePushDay)
    }
}
