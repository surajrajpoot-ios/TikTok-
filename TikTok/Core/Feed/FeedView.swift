//
//  FeedView.swift
//  TikTok
//
//  Created by surajkumar on 22/03/26.
//

import SwiftUI
import AVKit
struct FeedView: View {
    @StateObject var videoModel = FeedViewModel()
    @State private var player = AVPlayer()
    @State private var scrollPosition: String?
    var body: some View {
        ScrollView {
            LazyVStack(spacing:0){
                ForEach(videoModel.posts){ post in
                    FeedCell(post: post,player:player)
                        .id(post.id)
                }
            }
            .scrollTargetLayout()
        }
        .onAppear{
            player.play()
        }
        
        .scrollTargetBehavior(.paging)
        .scrollPosition(id: $scrollPosition)
    
        .ignoresSafeArea()
        .onChange(of:scrollPosition) { oldValue, newValue in
            pv(postid: newValue)
        }
    }
    func pv(postid:String?){
        guard let currentPost = videoModel.posts.first(where:{$0.id == postid}) else { return}
       player.replaceCurrentItem(with: nil)
        let playerItem = AVPlayerItem(
            url: URL(string: currentPost.videoUrl)!)
        player.replaceCurrentItem(with: playerItem)
        }
    
}

#Preview {
    FeedView()
}

