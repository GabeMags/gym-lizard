//
//  TemplatesSubview.swift
//  Gym Lizard
//
//  Created by Gabriel Magallanes on 9/10/23.
//

import SwiftUI

struct TemplatesSubview: View {
    var body: some View {
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
    }
}

struct TemplatesSubview_Previews: PreviewProvider {
    static var previews: some View {
        TemplatesSubview()
    }
}
