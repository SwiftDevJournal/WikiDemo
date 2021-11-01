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
        DocumentGroup(newDocument: Wiki()) { file in
            ContentView(wiki: file.$document)
        }
    }
}
