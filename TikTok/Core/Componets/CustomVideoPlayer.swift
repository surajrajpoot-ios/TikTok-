//
//  CustomVideoPlayer.swift
//  TikTok
//
//  Created by surajkumar on 24/03/26.
//

import Foundation
import SwiftUI
import AVKit
struct CustomVideoPlayer:UIViewControllerRepresentable{
    var player:AVPlayer
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let  controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.videoGravity = .resizeAspectFill
        controller.allowsPictureInPicturePlayback = true
        controller.exitsFullScreenWhenPlaybackEnds = true
        
        return controller
    }
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}
