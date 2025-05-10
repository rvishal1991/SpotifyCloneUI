//
//  PlaylistHeaderCell.swift
//  SwiftfulSwiftUiPractice
//
//  Created by apple on 08/05/25.
//

import SwiftUI
import SwiftfulUI

struct PlaylistHeaderCell: View {
    
    var height:CGFloat = 300
    var title:String = "Some Playlist title"
    var subTitle:String = "Some Playlist subtitle"
    var imageName:String = Constants.randomImage
    var shadowColor: Color = .spotifyBlack.opacity(0.8)
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay {
                ImageLoaderView(urlString: imageName)
            }
            .overlay(alignment: .bottomLeading, content: {
                VStack(alignment: .leading, spacing: 8) {
                    Text(subTitle)
                        .font(.subheadline)
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)

                }
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    LinearGradient(colors: [shadowColor.opacity(0), shadowColor], startPoint: .top, endPoint: .bottom)
                )
            })
            .asStretchyHeader(startingHeight: height)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ScrollView {
            PlaylistHeaderCell()
        }
        .ignoresSafeArea()
    }
    
}
