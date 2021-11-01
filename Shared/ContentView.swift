//
//  ContentView.swift
//  Shared
//
//  Created by mark on 11/1/21.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: WikiDemoDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(WikiDemoDocument()))
    }
}
