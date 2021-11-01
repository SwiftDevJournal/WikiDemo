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
    @Environment(\.editMode) private var editMode
    @State private var disableTextField = true
    
    var body: some View {
        VStack {
            Text("Pages")
                .font(.title)
            List {
                ForEach($wiki.pages) { $page in
                    NavigationLink(destination: PageView(page: $page),
                                   tag: page,
                                   selection: $selectedPage) {
                        // Only allow changing the page's title when someone taps the Edit button.
                        // I found that too many times tapping on a page title takes me to changing the title when what I really want is to edit the page. People are going to be editing pages way more than renaming them. It makes sense to only allow page renaming when tapping the Edit button.
                        TextField("", text: $page.title)
                            .disabled(disableTextField)
                            .onChange(of: editMode?.wrappedValue) { newValue in
                                if (newValue != nil) && (newValue!.isEditing) {
                                    disableTextField = false
                                }
                                else {
                                    disableTextField = true
                                }
                            }
                    }
                }
                .onDelete(perform: deletePage)
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Pages")
            Button(action: { showAddSheet = true }, label: {
                Label("Add", systemImage: "note.text.badge.plus")
            })
            Spacer()
            .sheet(isPresented: $showAddSheet) {
                AddPageView(wiki: $wiki)
            }
        }
        .toolbar {
            EditButton()
        }
    }
    
    func deletePage(at offsets: IndexSet) {
        wiki.pages.remove(atOffsets: offsets)
    }
}
    


struct PageListView_Previews: PreviewProvider {
    static var previews: some View {
        PageListView(wiki: .constant(Wiki()))
    }
}
