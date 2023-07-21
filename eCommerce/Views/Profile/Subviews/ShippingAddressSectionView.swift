//
//  ShippingAddressSectionView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 07/07/2023.
//

import SwiftUI

struct ShippingAddressSectionView: View {
    var fields: [(label: String, value: Binding<String>)]
    @Binding var isAddingAddress: Bool
    let shippingAddress: ShippingAddress?
    let addAction : () -> Void
    let removeAction : () -> Void

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("MY SHIPPING ADDRESS")
                    .font(.custom(AppFont.semiBoldFont, size: 15))
                    .foregroundColor(RCValues.shared
                        .color(forKey: .primary))
                    .padding(.leading, 25)                    
                Spacer()
                Button {
                    isAddingAddress.toggle()
                } label: {
                    Image(systemName: shippingAddress == nil ? "plus.circle" : "square.and.pencil")
                }
                .padding(.trailing, 20)
                .font(.custom(AppFont.semiBoldFont, size: 20))
                .foregroundColor(RCValues.shared
                    .color(forKey: .accent))
                .sheet(isPresented: $isAddingAddress) {
                    NavigationStack {
                        AddOrEditShippingAddressView(
                            fields: fields,
                            shippingAddress: shippingAddress,
                            isAddingAddress: $isAddingAddress
                        ) {
                            addAction()
                        } removeAction: {
                            removeAction()
                        }
                    }
                }
            }
            .padding(.top)
            .padding(.bottom, -10)
            ZStack {
                ZStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width - 80, height: 180)
                        .foregroundColor(.white)
                    
                    ZStack {
                        if let shippingAddress = shippingAddress {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("\(shippingAddress.streetNumber) \(shippingAddress.streetName)")
                                    Text("\(shippingAddress.postalCode) \(shippingAddress.town)")
                                    Text(shippingAddress.country.uppercased())
                                }
                                .font(.custom(AppFont.regularFont, size: 18))
                                .foregroundColor(RCValues.shared
                                    .color(forKey: .primary))
                                .frame(width: UIScreen.main.bounds.width - 120, height: 160)
                        } else {
                            Circle()
                                .fill(Color(UIColor.secondarySystemBackground))
                                .frame(width: 100)
                            Image(systemName: "shippingbox")
                                .font(.custom(AppFont.semiBoldFont, size: 50))
                                .foregroundColor(Color(UIColor.secondaryLabel))
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: 250)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.secondarySystemBackground))
    }
}

struct ShippingAddressSectionView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            ShippingAddressSectionView(
                fields:
                    [
                        (label: "Street Number", value: .constant("")),
                        (label: "Street Name", value: .constant("")),
                        (label: "Postal Code", value: .constant("")),
                        (label: "Town", value: .constant("")),
                        (label: "Country", value: .constant(""))
                    ],
                isAddingAddress: .constant(false),
                shippingAddress: nil
            ) {} removeAction: {}
        }
    }
}
