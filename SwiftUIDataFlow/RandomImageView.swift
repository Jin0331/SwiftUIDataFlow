//
//  RandomImageView.swift
//  SwiftUIDataFlow
//
//  Created by JinwooLee on 4/21/24.
//

import SwiftUI

struct RandomgImageView: View {
    
    let url = URL(string: "https://picsum.photos/200/300")
    var body: some View {
        VStack {
            
            AsyncImage(url: url) { data in
                switch data {
                case .empty:
                    ProgressView()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 200)
                        .cornerRadius(25)
                case .failure(let error):
                    Image(systemName: "star.fill")
                }
                
            }
        }
    }
}

#Preview {
    RandomgImageView()
}
