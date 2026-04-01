//
//  ForgetView.swift
//  TikTok
//
//  Created by surajkumar on 28/03/26.
//

import SwiftUI

struct ForgetView: View {
    @State private var email:String = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var isSent:Bool = false
    @State private var isNotSent:Bool = false
    var body: some View {
        VStack{
            VStack(alignment:.leading){
                
                Text("Reset Password")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue.opacity(0.7))
                Text("Enter the email associated with your account. We will send you a link to reset your password.")
                    .font(.subheadline)
                InputView(placeholder: "Enter your email here", issecure: false, text: $email)
            }
            .padding()
            .padding(.leading,8)
            Button {
                Task{
                   await  authViewModel.resetYourPassword(email: email)
                }
                if !email.isEmpty {
                    isSent = true
                }
                if email.isEmpty {
                    isNotSent = true
                }
            } label: {
                Text("Send instructions")
                    .foregroundColor(.white)
                .frame(width: 330,height: 14)
                .padding()
                .background(Color.teal.opacity(0.8))
                .cornerRadius(20)
            }
          Spacer()
            
        }
        .alert("Success ", isPresented: $isSent){
            Text("we sent a reset link to your email\(email)")
            Button("OK",role:.cancel){
                
            }
        }
            .alert("Some thing went wrong ", isPresented: $isNotSent){
                Button("OK",role:.cancel){
                    
                }
            }
        
    }
}

#Preview {
    ForgetView()
}
