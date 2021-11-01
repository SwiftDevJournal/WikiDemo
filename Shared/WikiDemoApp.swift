//
//  WikiDemoApp.swift
//  Shared
//
//  Created by mark on 11/1/21.
//

import SwiftUI

@main
struct WikiDemoApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: WikiDemoDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
