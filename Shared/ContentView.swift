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
    // Need a way to access the selected page.
    
    var body: some View {
        NavigationView {
            PageListView(wiki: $wiki)
            PageView(page: .constant(Page(text: "")))
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(wiki: .constant(Wiki()))
    }
}
