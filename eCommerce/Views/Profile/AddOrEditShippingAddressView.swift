//
//  AddShippingAddressView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 09/07/2023.
//

import SwiftUI

struct AddOrEditShippingAddressView: View {
    var fields: [(label: String, value: Binding<String>)]
    let shippingAddress: ShippingAddress?
    @Binding var isAddingAddress: Bool
    let addAction : () -> Void
    let removeAction : () -> Void

    var body: some View {
        ScrollView {
            ForEach(fields, id: \.self.0.description) { field in
                VStack(alignment: .leading) {
                    Text(field.label)
                        .font(.custom(AppFont.semiBoldFont, size: 18))
                        .foregroundColor(RCValues.shared
                            .color(forKey: .primary))
                        .padding(.leading, 15)
                    HStack {
                        TextField("Add information", text: field.value)
                            .foregroundColor(RCValues.shared
                                .color(forKey: .primary))
                            .padding(.leading)
                    }
                }
                .padding(.horizontal)
                Divider()
                    .padding(.vertical, 10)
            }
            if shippingAddress != nil {
                Button {
                    removeAction()
                } label: {
                    Text("Remove shipping address")
                        .font(.custom(AppFont.semiBoldFont, size: 18))
                        .foregroundColor(.white)
                }
                .padding(.top)
                .buttonStyle(.borderedProminent)
                .tint(RCValues.shared
                    .color(forKey: .accent))

            }
        }
        .padding(.top, 30)
        .padding(.horizontal)
        .navigationTitle(shippingAddress == nil ? "Add shipping address" : "Edit shipping address")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    isAddingAddress.toggle()
                } label: {
                    Text("Cancel")
                        .foregroundColor(RCValues.shared
                            .color(forKey: .accent))
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    addAction()
                } label: {
                    Text("Save")
                        .foregroundColor(RCValues.shared
                            .color(forKey: .accent))
                }
            }
        }
    }
}

struct AddOrEditShippingAddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddOrEditShippingAddressView(
                fields:
                    [
                        (label: "Street Number", value: .constant("235")),
                        (label: "Street Name", value: .constant("Oxford Street")),
                        (label: "Postal Code", value: .constant("W1D 1BS")),
                        (label: "Town", value: .constant("London")),
                        (label: "Country", value: .constant("UK"))
                    ],
                shippingAddress: nil,
                isAddingAddress: .constant(false)
            ) {} removeAction: {}
        }
    }
}
