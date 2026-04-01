//
//  PostGridView.swift
//  TikTok
//
//  Created by surajkumar on 24/03/26.
//

import SwiftUI

struct PostGridView: View {
    private let items = [GridItem(.flexible(), spacing: 1),GridItem(.flexible(), spacing: 1),GridItem(.flexible())
    ]
    var body: some View {
        LazyVGrid(columns:items,spacing: 2){
            ForEach(0..<15){ post  in
                Rectangle()
                    .frame(width: 132, height: 160)
                    .clipped()
            }
        }
    }
}

#Preview {
    PostGridView()
}
