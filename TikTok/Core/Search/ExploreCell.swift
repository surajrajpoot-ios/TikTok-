//
//  ExploreCell.swift
//  TikTok
//
//  Created by surajkumar on 22/03/26.
//

import SwiftUI

struct ExploreCell: View {
    var body: some View {
        HStack(spacing: 6){
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width:50,height: 50)
                .foregroundStyle(Color(.systemGray5))
           
            VStack(alignment: .leading){
                Text("Hemant_Lodhi454")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("Hemant Lodhi")
                    .font(.footnote)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ExploreCell()
}
