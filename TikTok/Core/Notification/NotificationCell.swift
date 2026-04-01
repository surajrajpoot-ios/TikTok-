//
//  NotificationCell.swift
//  TikTok
//
//  Created by surajkumar on 23/03/26.
//

import SwiftUI

struct NotificationCell: View {
    var body: some View {
        HStack{
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width:50,height: 50)
                .foregroundStyle(Color(.systemGray5))
            HStack{
                Text("Hemant_lodhi245 ")
                    .font(.footnote)
                    .fontWeight(.semibold) +
            
                Text(" liked one of your post by ")
                    .font(.footnote) +
                Text("3d+")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .fontWeight(.bold)
            }
            Spacer()
            Rectangle()
                .frame(width:48,height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding()
    }
}

#Preview {
    NotificationCell()
}
