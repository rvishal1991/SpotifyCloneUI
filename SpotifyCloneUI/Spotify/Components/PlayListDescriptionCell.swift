//
//  PlayListDescriptionCell.swift
//  SwiftfulSwiftUiPractice
//
//  Created by apple on 08/05/25.
//

import SwiftUI

struct PlayListDescriptionCell: View {
    
    var descriptionText: String  = Product.mock.description ?? ""
    var userName:String = "Vishal"
    var subHeadline:String = "Some headline goes here"
    var onAddToPlaylistPressed:( () -> Void)? = nil
    var onDownloadPressed:( () -> Void)? = nil
    var onSharePressed:( () -> Void)? = nil
    var onMorePressed:( () -> Void)? = nil
    var onShufflePressed:( () -> Void)? = nil
    var onPlayPressed:( () -> Void)? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(descriptionText)
                .font(.caption)
                .foregroundColor(.spotifyLightGray)
                .frame(maxWidth: .infinity, alignment: .leading)
            madeForYouSection
            Text(subHeadline)
            buttonsRow
        }
        .font(.callout)
        .fontWeight(.medium)
        .foregroundStyle(.spotifyLightGray)
    }
    
    
    private var madeForYouSection: some View {
        HStack( spacing: 8){
            Image(systemName: "applelogo")
                .font(.title)
                .foregroundStyle(.spotifyGreen)
            
            Text("Made for ")
            +
            Text(userName)
                .bold()
                .foregroundStyle(.spotifyWhite)
            
        }
    }
    
    private var buttonsRow: some View {
        HStack(spacing:0) {
            HStack(spacing:0) {
                Image(systemName: "plus.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "arrow.down.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "square.and.arrow.up")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "ellipsis")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                
            }
            .offset(x:-8)
            .frame(maxWidth: .infinity, alignment: .leading)

            
            HStack(spacing:8) {
                Image(systemName: "shuffle")
                    .font(.system(size: 24))
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 48))
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
            }
            .foregroundStyle(.spotifyGreen)
        }
        .font(.title2)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        PlayListDescriptionCell()
            .padding()
    }
    
}
