//
//  QuickstartSubview.swift
//  Gym Lizard
//
//  Created by Gabriel Magallanes on 9/10/23.
//

import SwiftUI

struct QuickstartSubview: View {
    var body: some View {
        VStack{
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
        }
    }
}

struct QuickstartSubview_Previews: PreviewProvider {
    static var previews: some View {
        QuickstartSubview()
    }
}
