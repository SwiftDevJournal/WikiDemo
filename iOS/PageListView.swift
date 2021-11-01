//
//  PageListView.swift
//  WikiDemo
//
//  Created by mark on 11/1/21.
//

import SwiftUI

struct PageListView: View {
    @Binding var wiki: Wiki
    @State private var selectedPage: Page? = nil
    @State private var showAddSheet = false
    
    var body: some View {
        VStack {
            Text("Pages")
                .font(.title)
            List {
                ForEach($wiki.pages) { $page in
                    NavigationLink(destination: PageView(page: $page),
                                   tag: page,
                                   selection: $selectedPage) {
                        TextField("", text: $page.title)
                    }
                }
                .onDelete { _ in
                    if selectedPage != nil {
                        wiki.removePage(title: selectedPage!.title)
                    }
                }
            }
            
            .listStyle(SidebarListStyle())
            .navigationTitle("Pages")
            Button(action: { showAddSheet = true }, label: {
                Label("Add", systemImage: "note.text.badge.plus")
            })
        }
        
        .sheet(isPresented: $showAddSheet) {
            AddPageView(wiki: $wiki)
        }
    }
    
}

struct PageListView_Previews: PreviewProvider {
    static var previews: some View {
        PageListView(wiki: .constant(Wiki()))
    }
}
