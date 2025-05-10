//
//  SpotifyRecentsCell.swift
//  SwiftfulSwiftUiPractice
//
//  Created by apple on 07/05/25.
//

import SwiftUI

struct SpotifyRecentsCell: View {
    
    var imageName:String = Constants.randomImage
    var title:String = "Some random"
    
    var body: some View {
        HStack(spacing: 16) {
            ImageLoaderView(urlString: imageName)
                .frame(width: 60, height: 60)
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
        }
        .padding(.trailing, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .themeColors(isSelected: false)
        .cornerRadius(16)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack {
            HStack {
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
            HStack {
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
        }
    }
   
}
