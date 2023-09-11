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
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack (alignment: .leading){
                    Text("Quick Start")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .font(.title2)
                        
                    Button(){
                        print("Start empty workout pressed")
                    } label: {
                        Label("Start an Empty Workout", systemImage: "dumbbell.fill")
                            .padding(.horizontal, 70)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.regular)
                    .foregroundColor(.black)
                    .tint(.orange)
                    .frame(maxWidth: .infinity)
                    
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
                    
                    LazyVGrid(columns: columns) {
                        
                    }
                    
                    Spacer()
            }
            
            }
            .navigationTitle("Start workout")
            
            
        }
    }
}

struct StartWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        StartWorkoutView()
    }
}
