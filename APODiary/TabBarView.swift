//
//  TabBarView.swift
//  APODiary
//
//  Created by Dianelys Saldaña on 6/27/25.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ImageView()
                .tabItem {
                    Label("Image", systemImage: "photo")
                }

            InfoView()
                .tabItem {
                    Label("Info", systemImage: "info.circle")
                }
        }
    }
}

#Preview {
    TabBarView()
}
