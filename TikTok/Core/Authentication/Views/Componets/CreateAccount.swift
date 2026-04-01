//
//  CreateAccount.swift
//  TikTok
//
//  Created by surajkumar on 25/03/26.
//

import SwiftUI

struct CreateAccount: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var name: String = ""
    @State private var isEmpty:Bool = false
    @State private var isSuccess:Bool = false
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ScrollView{
            VStack{
                Image("S")
                    .resizable()
                    .scaledToFit()
                Divider()
                InputView(placeholder: "Enter Your full name", issecure: false,text: $name )
                InputView(placeholder: "Enter email or phone number", issecure: false,text: $email )
                InputView(placeholder: "password", issecure: true,text: $password )
                ZStack{
                    InputView(placeholder: "Confirm Password", issecure: true, text: $confirmPassword)
                        .overlay(alignment: .trailing) {
                            if !password.isEmpty && !confirmPassword.isEmpty {
                                Image(systemName: "\(isSame ? "checkmark" : "xmark").circle.fill")
                                    .fontWeight(.bold)
                                    .foregroundColor(isSame ? .green : .red)
                            }
                        }
                }
                Divider()
                Spacer()
               
                Button {
                    if name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty || !isSame {
                        isEmpty = true
                        return
                    }
                    if !isEmpty{
                        isSuccess = true
                    }
                    if !isEmpty{
                        presentationMode.wrappedValue.dismiss()
                    }
                    Task {
                        await authViewModel.createUser(email: email, name: name, password: password)
                    }
                } label: {
                    Text("Create Account")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.teal, in : RoundedRectangle(cornerRadius: 20))
                                            }
        }
        .alert("something went wrong", isPresented: $isEmpty) {
            Button("OK", role: .cancel) { }
        }
        .alert("Account Created", isPresented: $isSuccess) {
            Button("OK", role: .cancel) { }
        }
        .ignoresSafeArea()
        .padding(.horizontal)
        .padding(.vertical,3)
        .navigationBarTitle("Create Account")
     
    }
    var isSame: Bool {
        password == confirmPassword
    }
}

#Preview {
    CreateAccount()
        .environmentObject(AuthViewModel())
}
