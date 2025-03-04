//
//  PageListView.swift
//  WikiDemo
//
//  Created by mark on 11/1/21.
//

import SwiftUI

struct PageListView: View {
    @Binding var wiki: Wiki
    @Binding var selectedPage: Page?
    @State private var showAddSheet = false
    
    var body: some View {
        VStack {
            List(selection: $selectedPage) {
                Section(header: Text("Pages")) {
                    ForEach($wiki.pages, id: \.id) { $page in
                        NavigationLink(value: page) {
                            TextField("", text: $page.title)
                        }
                    }
                }
            }
            .onDeleteCommand {
                if selectedPage != nil {
                    wiki.removePage(title: selectedPage!.title)
                }
            }
            HStack {
                Button(action: { showAddSheet = true }, label: {
                    Label("Add", systemImage: "note.text.badge.plus")
                })

                Spacer()

                Button(action: {
                    if selectedPage != nil {
                        wiki.removePage(title: selectedPage!.title)
                    }
                    
                }, label: {
                    Label("Delete", systemImage: "trash")
                        .foregroundColor(.red)
                })
                    .keyboardShortcut(.delete, modifiers: [])
            }
            .padding(.horizontal, 6)
            .padding(6)
        }
        
        .sheet(isPresented: $showAddSheet) {
            AddPageView(wiki: $wiki)
        }
    }
    
}

struct PageListView_Previews: PreviewProvider {
    static var previews: some View {
        PageListView(wiki: .constant(Wiki()), selectedPage: .constant(Page()))
    }
}
