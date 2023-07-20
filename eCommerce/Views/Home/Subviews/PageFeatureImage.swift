//
//  PageFeatureImage.swift
//  eCommerce
//
//  Created by Imen Ksouri on 01/07/2023.
//

import SwiftUI

struct PageFeatureImage: View {
    var featureImage: String
    
    var body: some View {
        Image(featureImage)
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}

struct PageFeatureImage_Previews: PreviewProvider {
    static var previews: some View {
        PageFeatureImage(featureImage: "feature2")
    }
}
