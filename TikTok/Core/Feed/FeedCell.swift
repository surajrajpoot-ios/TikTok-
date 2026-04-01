//
//  FeedCell.swift
//  TikTok
//
//  Created by surajkumar on 22/03/26.
//

import SwiftUI
import AVKit

struct FeedCell: View {
    let post: Post
    var player: AVPlayer
    init(post: Post,player: AVPlayer) {
        self.post = post
        self.player = player
    }
    var body: some View {
        ZStack {
            CustomVideoPlayer(player: player)
        
                    .containerRelativeFrame([.horizontal, .vertical])
            VStack {
                Spacer()
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text("Carlos_ prints")
                            .fontWeight(.semibold)
                        Text(" Nasa have to launch a rocket to the moon")
                    }
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    Spacer()
                    VStack(spacing: 28) {
                        Circle()
                            .frame(width: 42, height: 42)
                            .foregroundStyle(.gray)
                        Button {
                            
                        } label: {
                            VStack {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(.white)
                                Text("22")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                            }
                        }
                        Button {
                            
                        } label: {
                            VStack {
                                Image(systemName: "ellipsis.bubble.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(.white)
                                Text("29")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                            }
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "bookmark.fill")
                                .resizable()
                                .frame(width: 22, height: 28)
                                .foregroundStyle(.white)
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "arrowshape.turn.up.right.fill")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .foregroundStyle(.white)
                        }
                    }
                }
                .padding(.bottom, 80)
            }
            .padding()
        }
        .onTapGesture {
            switch player.timeControlStatus {
            case .paused:
                player.play()
            case .waitingToPlayAtSpecifiedRate:
                break
            case .playing:
                player.pause()
            }
        }
       
    }
}

#Preview {
    FeedCell(post: Post(id: UUID().uuidString, videoUrl:   "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"),player: AVPlayer())
}

