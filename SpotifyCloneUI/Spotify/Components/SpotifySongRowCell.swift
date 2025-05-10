//
//  SpotifySongRowCell.swift
//  SpotifyCloneUI
//
//  Created by apple on 08/05/25.
//

import SwiftUI

struct SpotifySongRowCell: View {
    
    var imageName: String = Constants.randomImage
    var imageSize:CGFloat = 50
    var title: String? = "Some title goes here"
    var subtitle: String? = "Some artist name"
    var onCellPressed: (() -> Void)? = nil
    var onMorePressed: (() -> Void)? = nil

    var body: some View {
        HStack(spacing:8) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            VStack(alignment: .leading, spacing: 4) {
                if let title = title{
                    Text(title)
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundStyle(.spotifyWhite)
                }
                
                if let subtitle = subtitle{
                    Text(subtitle)
                        .font(.callout)
                        .foregroundStyle(.spotifyLightGray)
                }
               
            }
            .lineLimit(2)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "ellipsis")
                .font(.subheadline)
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                    onMorePressed?()
                }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.black.opacity(0.001))
        .onTapGesture {
            onCellPressed?()
        }
    }
}

#Preview {
    
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack {
            SpotifySongRowCell()
            SpotifySongRowCell()
            SpotifySongRowCell()
            SpotifySongRowCell()
        }

    }
}
