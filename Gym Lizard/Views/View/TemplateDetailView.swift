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
                    .padding(.leading)
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
                ForEach(MockData.sampleTemplate.workoutData.keys.sorted(), id: \.self) { workoutItem in
                    if let sets = MockData.sampleTemplate.workoutData[workoutItem] {
                        HStack {
                            Text(workoutItem)
                                .font(.subheadline)
                                .padding()
                            Spacer()
                        }
                    }
                }
                
            }
        }
        .frame(maxHeight: 300)
       
    }
}

struct TemplateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateDetailView(template: MockData.sampleTemplate)
    }
}
