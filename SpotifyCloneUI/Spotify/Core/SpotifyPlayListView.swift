//
//  SpotifyPlayListView.swift
//  SwiftfulSwiftUiPractice
//
//  Created by apple on 08/05/25.
//

import SwiftUI
import SwiftfulRouting

struct SpotifyPlayListView: View {
    
    @Environment(\.router) var router

    
    var product:Product = .mock
    var currentUser:User? = .mock
    
    @State private var products:[Product] = []
    @State private var showHeader:Bool = true

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack(spacing:12) {
                    PlaylistHeaderCell(
                        height: 250,
                        title: product.title ?? "",
                        subTitle: product.brand ?? "",
                        imageName: product.thumbnail ?? ""
                    )
                    .readingFrame { frame in
                        showHeader = frame.maxY < 150
                    }
                    PlayListDescriptionCell(
                        descriptionText: product.description ?? "",
                        userName: currentUser?.firstName ?? "",
                        subHeadline: product.category ?? "",
                        onAddToPlaylistPressed: nil,
                        onDownloadPressed: nil,
                        onSharePressed: nil,
                        onMorePressed: nil,
                        onShufflePressed: nil,
                        onPlayPressed: nil
                    )
                    .padding(.horizontal, 16)
                    
                    
                    ForEach(products) { product in
                        SpotifySongRowCell(
                            imageName: product.firstImage,
                            imageSize: 50,
                            title: product.title ?? "",
                            subtitle: product.brand) {
                                goToPlayListView(product: product)
                            } onMorePressed: {
                                
                            }
                            .padding(.leading, 16)
                    }
                }
            }
            .scrollIndicators(.hidden)
            
            header
           
        }
        .task {
            await getData()
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
    
    private func getData() async  {
        do{
            products = try await DatabaseHelper().getProducts()
        }catch{
        }
    }
    
    private func goToPlayListView(product:Product){
        guard let currentUser = currentUser else { return  }
        router.showScreen(.push) { _ in
            SpotifyPlayListView(product: product, currentUser: currentUser)
        }

    }
    
    private var header:some View {
        ZStack {
            Text(product.title ?? "")
                .font(.headline)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background(.spotifyBlack)
                .offset(y : showHeader ? 0 : -40)
                .opacity(showHeader ? 1 : 0)
            
            Image(systemName: "chevron.left")
                .font(.title3)
                .padding(10)
                .background(showHeader ? Color.black.opacity(0.001) : Color.spotifyGray.opacity(0.7))
                .clipShape(.circle)
                .onTapGesture {
                    router.dismissScreen()
                }
                .padding(.horizontal, 10)
                .frame(maxWidth: .infinity, alignment: .leading)

        }
        .foregroundStyle(.spotifyWhite)
        .animation(.smooth(duration: 0.3), value: showHeader)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    RouterView { _ in
        SpotifyPlayListView()
    }
    
}
