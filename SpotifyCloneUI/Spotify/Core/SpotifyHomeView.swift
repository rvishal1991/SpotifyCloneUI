//
//  SpotifyHomeView.swift
//  SwiftfulSwiftUiPractice
//
//  Created by apple on 06/05/25.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

@Observable
final class SpotifyHomeViewModel  {
    let router:AnyRouter
    
    var currentUser:User? = nil
    var selectedCategory:Category? = nil
    var products:[Product] = []
    var productRows:[ProductRow] = []
    
    init(router: AnyRouter) {
        self.router = router
        self.currentUser = currentUser
        self.selectedCategory = selectedCategory
        self.products = products
        self.productRows = productRows
    }
    
    func getData() async  {
        guard products.isEmpty else { return  }
        do{
            currentUser = try await DatabaseHelper().getUsers().first
            products = try await Array(DatabaseHelper().getProducts().prefix(upTo: 8))
            
            var rows:[ProductRow] = []
            
            let allBrands = Set(products.map { $0.brand ?? "" })
            
            for brand in allBrands{
//                let products = self.products.filter { $0.brand ?? "" == brand }
                rows.append(ProductRow(title: brand.capitalized, products: products))
            }
            productRows = rows
        }catch{
        }
    }
}

struct SpotifyHomeView: View {
    
//    @Environment(\.router) var router
//
//    @State private var currentUser:User? = nil
//    @State private var selectedCategory:Category? = nil
//    @State private var products:[Product] = []
//    @State private var productRows:[ProductRow] = []
 

    @State var viewModel: SpotifyHomeViewModel
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders]) {
                    Section {
                        VStack(spacing:16){
                            recentSection
                            if let product = viewModel.products.first{
                                newReleaseSection(product: product)
                            }
                        }
                        .padding(.horizontal, 16)
                        listRows
                            .padding(.vertical)
                    } header: {
                        header
                    }
                }
                .padding(.top, 8)
            }
            .scrollIndicators(.hidden)
            .clipped()
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
        .task {
            await viewModel.getData()
        }
    }
    
//    private func getData() async  {
//        guard products.isEmpty else { return  }
//        do{
//            currentUser = try await DatabaseHelper().getUsers().first
//            products = try await Array(DatabaseHelper().getProducts().prefix(upTo: 8))
//            
//            var rows:[ProductRow] = []
//            
//            let allBrands = Set(products.map { $0.brand ?? "" })
//            
//            for brand in allBrands{
////                let products = self.products.filter { $0.brand ?? "" == brand }
//                rows.append(ProductRow(title: brand.capitalized, products: products))
//            }
//            productRows = rows
//        }catch{
//        }
//    }
    
    private var header: some View {
        HStack(spacing: 0) {
            ZStack {
                if let currentUser = viewModel.currentUser {
                    ImageLoaderView(urlString: currentUser.image ?? "")
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            viewModel.router.dismissScreen()
                        }
                }
            }
            .frame(width: 36, height: 36)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8){
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected: category == viewModel.selectedCategory
                        )
                        .onTapGesture {
                            viewModel.selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 8)
        .background(.spotifyBlack)
    }
    
    private var recentSection: some View {
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: viewModel.products) { product in
            if let product = product {
                SpotifyRecentsCell(
                    imageName: product.firstImage,
                    title: product.title ?? ""
                )
                .asButton(.press) {
                    goToPlayListView(product: product)
                }
            }
        }
    }
    
    private func goToPlayListView(product:Product){
        guard let currentUser = viewModel.currentUser else { return  }
        viewModel.router.showScreen(.push) { _ in
            SpotifyPlayListView(product: product, currentUser: currentUser)
        }

    }
    
    private func newReleaseSection(product:Product) -> some View {
        SprotifyNewReleaseCell(
            imageName: product.firstImage,
            headline: product.brand,
            subheadline: product.category,
            title: product.title,
            subtitle: product.description) {
                
            } onPlayPressed: {
                goToPlayListView(product: product)
            }
    }
    
    private var listRows: some View {
        ForEach(viewModel.productRows) { row in
            VStack(spacing : 8){
                Text(row.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.spotifyWhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)

                
                ScrollView(.horizontal) {
                    HStack(alignment: .top, spacing:16) {
                        ForEach(row.products) { product in
                            ImageTitleRowCell(
                                imageSize: 120,
                                imageName: product.firstImage,
                                title: product.title ?? ""
                            )
                            .asButton(.press) {
                                
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    RouterView { router in
        SpotifyHomeView(viewModel: SpotifyHomeViewModel(router: router))

    }
}
