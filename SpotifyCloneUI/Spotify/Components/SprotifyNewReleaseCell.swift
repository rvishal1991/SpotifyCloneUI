//
//  SprotifyNewReleaseCell.swift
//  SwiftfulSwiftUiPractice
//
//  Created by apple on 07/05/25.
//

import SwiftUI

struct SprotifyNewReleaseCell: View {
    
    var imageName:String = Constants.randomImage
    var headline:String? = "New Release from"
    var subheadline:String? = "Swiftful SwiftUI Practice"
    var title:String? = "Some Playlist"
    var subtitle:String? = "Single - title"
    
    var onAddToPlaylistPressed:(()->Void)? = nil
    var onPlayPressed:(()->Void)? = nil

    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 8){
                ImageLoaderView(urlString: imageName)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing:2) {
                    if let headline = headline {
                        Text(headline)
                            .font(.callout)
                            .foregroundColor(.spotifyLightGray)
                    }
                    
                    if let subheadline = subheadline {
                        Text(subheadline)
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundColor(.spotifyWhite)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 150, height: 150)
                
                VStack (alignment: .leading, spacing: 32){
                    VStack (alignment: .leading, spacing: 2){
                        if let title = title {
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundColor(.spotifyWhite)
                                .lineLimit(1)
                        }
                        
                        if let subtitle = subtitle {
                            Text(subtitle)
                                .foregroundColor(.spotifyLightGray)
                                .lineLimit(1)
                        }
                    }
                    .font(.callout)
                    
                    HStack(spacing:0) {
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.spotifyLightGray)
                            .font(.title3)
                            .padding(4)
                            .background(Color.black.opacity(0.001))
                            .onTapGesture {
                                onAddToPlaylistPressed?()
                            }
                            .offset(x:-4)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        
                        Image(systemName: "play.circle.fill")
                            .foregroundStyle(.spotifyWhite)
                            .font(.title)
                            
                    }
                }
                .padding(.trailing, 16)
            }
            .themeColors(isSelected: false)
            .cornerRadius(16)
            .onTapGesture {
                onPlayPressed?()
            }
        }
        
    }
}

#Preview {
    
    ZStack {
        Color.black.ignoresSafeArea()
        SprotifyNewReleaseCell()
            .padding()

    }
    
}
