//
//  NewInTagView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 16/07/2023.
//

import SwiftUI

struct NewInTagView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .fill(.black)
                .frame(width: 50, height: 25)
            Text("New In")
                .font(.caption)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
    }
}

struct NewInTagView_Previews: PreviewProvider {
    static var previews: some View {
        NewInTagView()
    }
}
