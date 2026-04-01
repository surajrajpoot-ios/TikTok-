//
//  InputView.swift
//  TikTok
//
//  Created by surajkumar on 25/03/26.
//

import SwiftUI

struct InputView: View {
   @State var placeholder:String
   @State var issecure:Bool
    @Binding var text:String
    var body: some View {
        VStack(spacing:8){
            if !issecure{
                TextField(placeholder, text: $text)
                    .padding()
                    .background(.brown.opacity(0.1),in:RoundedRectangle(cornerRadius: 8))
            }
            else{
                SecureField(placeholder, text:$text)
                    .padding()
                    .background(.brown.opacity(0.1),in:RoundedRectangle(cornerRadius: 8))
            }
        }
    }
}

#Preview {
    InputView(placeholder: "Enter Email or Phone", issecure: false, text: .constant(""))
}
