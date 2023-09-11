//
//  TemplatesSubview.swift
//  Gym Lizard
//
//  Created by Gabriel Magallanes on 9/10/23.
//

import SwiftUI

struct TemplatesSubview: View {
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    let templates = [MockData.sampleTemplatePushDay, MockData.sampleTemplatePullDay, MockData.sampleTemplateLegDay]
    
    var body: some View {
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
                }
            }
            .padding()
        }
    }
}

struct TemplateView: View {
    let template: Template

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(template.name)
                .font(.headline)
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
    }
}
struct TemplatesSubview_Previews: PreviewProvider {
    static var previews: some View {
        TemplatesSubview()
    }
}
