//
//  ContentView.swift
//  SwiftUIDataFlow
//
//  Created by JinwooLee on 4/21/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var sectionTitle = ["1번째 section", "2번째 section", "3번째 section", "4번째 section"]
    @State var randomImages = [
        RandomgImageView(),RandomgImageView(),RandomgImageView(),RandomgImageView(),RandomgImageView(),RandomgImageView()
    ]
    var body: some View {
        
        ZStack {
            
            NavigationView {
                
                List {
                    
                    ForEach(0..<sectionTitle.count, id: \.self) { sectionIndex in
                        
                        Section(header: SectionTitle(title: sectionTitle[sectionIndex])) {
                            ScrollView(.horizontal) {
                                LazyHStack {
                                    ForEach(0..<randomImages.count, id: \.self) { index in
                                        NavigationLink {
                                            ReceiveView(url: randomImages[index].url, title: $sectionTitle[sectionIndex])
                                            
                                        } label: {
                                            randomImages[index]
                                        }
                                    }
                                }
                            }
                        }
                        
                    }
                    .navigationTitle("hi")
                    
                }
            }
        }
    }
    
}
    #Preview {
        ContentView()
    }
