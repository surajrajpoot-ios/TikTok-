//
//  LoginView.swift
//  TikTok
//
//  Created by surajkumar on 25/03/26.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var isNotFill:Bool = false
    private var line:some View{
        VStack{
            Divider().frame(height: 1)
        }
    }
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack{
                    Image("login")
                        .resizable()
                        .scaledToFit()
                    Divider()
                    Text("Lets connect with us!")
                        .font(.title)
                        .fontWeight(.semibold)
                    InputView(placeholder: "Enter email and Phone number", issecure: false, text: $email)
                    InputView(placeholder: "Enter Password", issecure: true, text: $password)
                    HStack{
                        Spacer()
                        NavigationLink {
                            ForgetView()
                                .environmentObject(authViewModel)
                        } label: {
                            Text("Forget password?")
                                .fontWeight(.medium)
                        }
                        
                    }
                    Button {
                        if email.isEmpty||password.isEmpty{
                            isNotFill = true
                            return
                        }
                        Task{
                         await authViewModel.login(email: email, password: password)
                        }
                    } label: {
                        Text("Login")
                            .foregroundColor(.white)
                            .frame(width: 330,height: 14)
                            .padding()
                            .background(Color.teal.opacity(0.8))
                            .cornerRadius(20)
                    }
                    
                    HStack{
                        line
                        Text("or")
                            .fontWeight(.semibold)
                        line
                    }
                    .padding(.top,12)
                    Button {
                        
                    } label: {
                        Label("SignUp with Apple", systemImage: "apple.logo")
                            .foregroundColor(.white)
                            .frame(width: 330,height: 14)
                            .padding()
                            .background(Color.black.opacity(0.8))
                            .cornerRadius(20)
                    }
                    Button {
                        
                    } label: {
                        HStack(spacing: 8) {
                            Image("google")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text("SignUp with Google")
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                        }
                        .frame(width: 330, height: 14)
                        .padding()
                        .background(Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                        .cornerRadius(20)
                    }
                    NavigationLink {
                       CreateAccount()
                            .environmentObject(authViewModel)
                    } label: {
                        HStack {
                            Text("Don't have an account?")
                                .foregroundColor(.primary)
                                .fontWeight(.semibold)
     
                            Text("Sign Up")
                                .fontWeight(.semibold)
                                .foregroundColor(.blue)
                        }
                    }
                    
                    //text
                    //emailtext
                    //passtext
                    //forget
                    //login button
                    // or divider
                    //apple signup button
                    // google
                    //donot have account 4 sinuop
                }
            }
            .alert("some thing went Wrong", isPresented: $isNotFill){
                Button("OK",role:.cancel){
                    
                }
            }
            .ignoresSafeArea()
            .padding(.horizontal)
            .padding(.vertical,8)
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}

