//
//  PageView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 01/07/2023.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var featureImages = ["feature1", "feature2", "feature3"]
    static var previews: some View {
        PageView(pages: featureImages.map { PageFeatureImage(featureImage: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
