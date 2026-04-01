//
//  ProfileHeaderView.swift
//  TikTok
//
//  Created by surajkumar on 23/03/26.
//

import SwiftUI

struct ProfileHeaderView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        NavigationStack {
            VStack{
                Image(systemName: "ellipsis.vertical")

                HStack{
                    Spacer()
                    Menu {
                        Button {
                            Task {
                                await authViewModel.deleteAccount()
                            }
                        } label: {
                            Text("Delete Account")
                                
                        }
                        Button {
                            authViewModel.signOut()
                        } label: {
                            Text("SignOut")
                                
                        }
                    } label:{
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(Color.black)
                    }
                    
                }
                .padding(.trailing,20)
                VStack{
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .foregroundStyle(Color(.systemGray))
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                    if let user = authViewModel.currentUser{
                        Text("\(user.name)")
                        
                            .bold()
                    }
                }
                .padding(.bottom, 20)
                HStack(spacing:30){
                    ProfileDetailsView(value:123,title:"posts")
                    ProfileDetailsView(value:123,title:"Following")
                    ProfileDetailsView(value:123,title:"Followers")
                    
                }
                NavigationLink {
                GuestProfileView()
                        .environmentObject(authViewModel)
                } label: {
                    Text("Edit Profile")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .frame(width: 370, height: 30)
                        .foregroundStyle(.black)
                        .background(Color.gray.opacity(0.4),in:RoundedRectangle(cornerRadius: 12) )
                }
                Divider()
                
            }
        }
        
    }
}

#Preview {
    ProfileHeaderView()
        .environmentObject(AuthViewModel())
}
struct ProfileDetailsView:View {
    var value:Int
    var title:String
    var body: some View{
        VStack{
            Text("\(value)")
                .fontWeight(.semibold)
            Text("\(title)")
                .font(.footnote)
        }
    }
    
}

