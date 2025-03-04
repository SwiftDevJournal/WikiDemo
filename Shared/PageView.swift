//
//  PageView.swift
//  WikiDemo
//
//  Created by mark on 11/1/21.
//

import SwiftUI
import Ink

struct PageView: View {
    @Bindable var page: Page
    
    var body: some View {
        HStack {
            TextEditor(text: $page.text)
            WebView(html: html)
        }
    }
    
    var html: String {
        let parser = MarkdownParser()
        return parser.html(from: page.text)
    }
}


struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(page: Page())
    }
}
