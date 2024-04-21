//
//  SectionTitle.swift
//  SwiftUIDataFlow
//
//  Created by JinwooLee on 4/21/24.
//

import SwiftUI

struct SectionTitle: View {
    
    var title : String
    
    var body: some View {
        Text(title)
            .font(.title3)
            .bold()
            .tint(.black)
    }
}

#Preview {
    SectionTitle(title: "test")
}
