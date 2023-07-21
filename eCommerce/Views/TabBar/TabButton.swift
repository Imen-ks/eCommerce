//
//  TabButton.swift
//  eCommerce
//
//  Created by Imen Ksouri on 01/07/2023.
//

import SwiftUI

struct TabButton: View {
    @Binding var currentTab: Tab
    var animation: Namespace.ID
    var tab: Tab

    var body: some View {
        GeometryReader { proxy in
            Button {
                withAnimation(.spring()) {
                    currentTab = tab
                }
            } label: {
                VStack(spacing: 0) {
                    Image(systemName: currentTab == tab ? tab.rawValue + ".fill" : tab.rawValue)
                        .resizable()
                        .foregroundColor(RCValues.shared
                            .color(forKey: .tabBarLabel))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 15)
                        .background(
                            ZStack {
                                if currentTab == tab {
                                    MaterialEffect(style: .regular)
                                        .background(RCValues.shared
                                            .color(forKey: .secondary))
                                        .clipShape(Circle())
                                        .matchedGeometryEffect(id: "Tab", in: animation)
                                    Text(tab.tabName)
                                        .foregroundColor(RCValues.shared
                                            .color(forKey: .tabBarLabel))
                                        .font(.footnote)
                                        .padding(.top, 50)
                                        .padding(.bottom, 10)
                                }
                            }
                        )
                        .contentShape(Rectangle())
                        .offset(y: currentTab == tab ? -15 : 0)
                }
            }
        }
        .frame(height: 25)
    }
}

struct TabButton_Previews: PreviewProvider {
    @State static var currentTab: Tab = .home
    @Namespace static var animation
    static var previews: some View {
        TabButton(currentTab: $currentTab, animation: animation, tab: .home)
    }
}
