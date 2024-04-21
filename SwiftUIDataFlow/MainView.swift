//
//  MainView.swift
//  SwiftUIDataFlow
//
//  Created by JinwooLee on 4/21/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            NetfilxView()
                .tabItem {
                    Image(systemName: "house")
                    Text("홈")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("검색")
                }
        }
    }
}

#Preview {
    MainView()
}
