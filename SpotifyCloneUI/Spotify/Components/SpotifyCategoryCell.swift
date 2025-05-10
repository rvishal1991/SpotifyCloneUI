//
//  SpotifyCategoryCell.swift
//  SwiftfulSwiftUiPractice
//
//  Created by apple on 06/05/25.
//

import SwiftUI

struct SpotifyCategoryCell: View {
   
    var title:String = "All"
    var isSelected:Bool = false
    
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 36)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .themeColors(isSelected: isSelected)
            .cornerRadius(16)
    }
}

extension View{
    
    func themeColors(isSelected:Bool) -> some View {
        self
        .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
        .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack(spacing: 40) {
            SpotifyCategoryCell(title: "Title goes here")
            SpotifyCategoryCell(title: "Title goes here", isSelected: true)
            SpotifyCategoryCell(isSelected: true)

        }
    }
}
