//
//  ContentView.swift
//  TikTok
//
//  Created by surajkumar on 21/03/26.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        if authViewModel.userSession == nil {
            LoginView()
                .environmentObject(authViewModel)
        }
        else{
            MainTabbarView()
                .environmentObject(authViewModel)
        }
    }
}

#Preview {
    ContentView()
}
