//
//  ButtonStyle.swift
//  TikTok
//
//  Created by surajkumar on 25/03/26.
//

import SwiftUI

struct ButtonStyle: View {
    @State var name: String
     let color: Color
    let color2: Color
    var body: some View {
        Button {
            
        } label: {
            Text(name)
                .foregroundColor(color)
                .frame(width: 330,height: 14)
                .padding()
                .background(color2.opacity(0.8))
                .cornerRadius(20)
        }

    }
}

#Preview {
    ButtonStyle(name: "Login", color: .white, color2: .teal)
}
