//
//  ReceiveView.swift
//  SwiftUIDataFlow
//
//  Created by JinwooLee on 4/21/24.
//

import SwiftUI

struct ReceiveView: View {
    let url : URL?
    @Binding var title : String
    var body: some View {
        VStack(alignment:.center) {
            AsyncImage(url: url) { data in
                
                switch data {
                case .empty:
                    ProgressView()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .cornerRadius(25)
                case .failure(let error):
                    Image(systemName: "star.fill")
                }
                
            }
            TextField(text: $title) {
                Text("Section title 입력")
                    .frame(alignment: .center)
            }
        }
    }
}
