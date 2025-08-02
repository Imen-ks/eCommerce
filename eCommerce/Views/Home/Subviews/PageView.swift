//
//  PageView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 01/07/2023.
//

import SwiftUI

struct PageView: View {
    var images: [String]
    @State private var currentPage = 0
    
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { image in
                PageFeatureImage(featureImage: image)
            }
        }
        .frame(height: 220)
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct PageView_Previews: PreviewProvider {
    static var featureImages = ["feature1", "feature2", "feature3"]
    static var previews: some View {
        PageView(images: featureImages)
    }
}
