//
//  SearchView.swift
//  SeSAC4SwiftUISearchTransition
//
//  Created by JinwooLee on 4/19/24.
//

import SwiftUI
// 스릴러 액션 SF 로맨스 애니메이션

struct Catagory : Hashable {
    let id = UUID()
    let name:String
    let count: Int
}


struct SearchView: View {
        
    @State var category = [
        Catagory(name: "스릴러", count: 1),
        Catagory(name: "액션", count: 1),
        Catagory(name: "SF", count: 3),
        Catagory(name: "로맨스", count: 4),
        Catagory(name: "애니메이션", count: 5)
    ]
    
    let item = ["SF", "가족", "스릴러"]
    
    @State var query : String = ""
    
    var filterCategory : [Catagory] {
        return query.isEmpty ? category : category.filter { $0.name.contains(query)}
    }
    
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(filterCategory, id: \.self) { value in
                    NavigationLink {
                        SearchDetailView(category: value)
                    } label: {
                        setupRows(value)
                    }
                }
            }
            .navigationTitle("영화 검색")
            .searchable(text: $query, placement: .navigationBarDrawer, prompt: "검색")
            .toolbar {
                ToolbarItemGroup(placement:.topBarTrailing) {
                    Button {
                        self.category.append(Catagory(name: item.randomElement()!, count: .random(in: 1...100)))
                    } label: {
                        Text("추가")
                    }
                }
            }
        }

    }
    
    func setupRows(_ category: Catagory) -> some View {
        HStack {
            Image(systemName: "person")
            Text("\(category.name) \(category.count)")
        }
    }
}

struct SearchDetailView : View {
    
    let category : Catagory
    
    var body: some View {
        Text("\(category.name) \(category.count)")
    }
}

#Preview {
    SearchView(query: "")
}
