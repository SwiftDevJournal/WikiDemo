//
//  AddPageView.swift
//  WikiDemo
//
//  Created by mark on 11/1/21.
//

import SwiftUI

struct AddPageView: View {
    @Binding var wiki: Wiki
    var newPage = Page(text: "")
    @State private var newPageTitle = "New Page"
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Enter the name for the new page")
                .font(.headline)
            TextField("Name", text: $newPageTitle)
                .padding(.vertical)
            
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()

                }, label: {
                    Text("Cancel")
                })
                .keyboardShortcut(.cancelAction)

                Spacer()
                
                Button( action: {
                    presentationMode.wrappedValue.dismiss()
                    wiki.addPage(title: newPageTitle)
                }, label: {
                    Text("Add Page")
                })
                .keyboardShortcut(.defaultAction)
            }
        }
        .padding()
        
    }
}

struct AddPageView_Previews: PreviewProvider {
    static var previews: some View {
        AddPageView(wiki: .constant(Wiki()))
    }
}
