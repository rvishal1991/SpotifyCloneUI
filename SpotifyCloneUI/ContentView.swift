//
//  ContentView.swift
//  SwiftfulSwiftUiPractice
//
//  Created by apple on 06/05/25.
//

import SwiftUI
import SwiftfulRouting
import SwiftfulUI

struct ContentView: View {

    @Environment(\.router) var router
    
    var body: some View {
        List(content: {
            Button("Open Spotify") {
                router.showScreen(.fullScreenCover) { router in
                    SpotifyHomeView(viewModel: SpotifyHomeViewModel(router: router))
                }
            }
        })
       
    }

}

#Preview {
    RouterView { _ in
        ContentView()

    }
    
}
