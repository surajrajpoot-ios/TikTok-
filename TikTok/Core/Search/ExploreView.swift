//
//  ExploreView.swift
//  TikTok
//
//  Created by surajkumar on 22/03/26.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack(){
                    ForEach(0..<20){  user in
                    ExploreCell()
                    }
                }
            }
            .navigationBarTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            .padding(10)
        }
    }
}

#Preview {
    ExploreView()
}
