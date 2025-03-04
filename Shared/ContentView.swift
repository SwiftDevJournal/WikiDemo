//
//  ContentView.swift
//  Shared
//
//  Created by mark on 11/1/21.
//

import SwiftUI

struct ContentView: View {
    @Binding var wiki: Wiki
    @State private var showAddSheet = false
    @State var selectedPage: Page? = nil
    
    var body: some View {
        NavigationSplitView {
            PageListView(wiki: $wiki, selectedPage: $selectedPage)
                .navigationDestination(item: $selectedPage) { selection in
                    PageView(page: selection)
                }
                .navigationSplitViewColumnWidth(ideal: 192)
        } detail: {
            Text("Select a page to view its contents.")
        }
        .onAppear {
            selectedPage = wiki.pages.first
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(wiki: .constant(Wiki()))
    }
}
