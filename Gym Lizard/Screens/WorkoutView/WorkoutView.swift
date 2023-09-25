//
//  WorkoutView.swift
//  Gym Lizard
//
//  Created by Gabriel Magallanes on 9/24/23.
//

import SwiftUI

struct WorkoutView: View {
    
    var template: Template
    
    var body: some View {
        VStack {
            HStack{
                // X button dismiss
                HStack {
                    Button {
//                        isShowingDetail = false
                    } label: {
                        Image(systemName: "timer")
                            .foregroundColor(Color(.label))
                            .imageScale(.large)
                            .frame(width: 40, height: 40)
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
            
            // Title
            Text(template.name)
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(template: MockData.sampleTemplateLegDay)
    }
}
