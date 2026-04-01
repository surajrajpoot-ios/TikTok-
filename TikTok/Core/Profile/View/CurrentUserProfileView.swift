//
//  CurrentUserProfileView.swift
//  TikTok
//
//  Created by surajkumar on 23/03/26.
//

import SwiftUI

struct CurrentUserProfileView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack{
                   ProfileHeaderView()
                    PostGridView()
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
