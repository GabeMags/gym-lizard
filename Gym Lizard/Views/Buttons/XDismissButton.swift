//
//  XDismissButton.swift
//  Gym Lizard
//
//  Created by Gabriel Magallanes on 9/10/23.
//

import SwiftUI

struct XDismissButton: View {
        
    var body: some View {
        HStack {
            Button {

            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.medium)
                    .frame(width: 44, height: 44)
            }
            Spacer()
        }
    }
}

struct XDismissButton_Previews: PreviewProvider {
    static var previews: some View {
        XDismissButton()
    }
}
