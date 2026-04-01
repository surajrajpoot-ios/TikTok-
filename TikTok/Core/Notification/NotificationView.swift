//
//  NotificationView.swift
//  TikTok
//
//  Created by surajkumar on 23/03/26.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack{
                    ForEach(0..<20){ noti in
                        NotificationCell()
                    }
                }
            }
            .navigationTitle("Notificaton")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.bottom, 80)
        }
      
    }
}

#Preview {
    NotificationView()
}
