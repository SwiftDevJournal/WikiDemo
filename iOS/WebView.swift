//
//  WebView.swift
//  WikiDemo
//
//  Created by mark on 11/1/21.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    var html: String
    
    init(html: String) {
        self.html = html
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(html, baseURL: nil)
    }
}
