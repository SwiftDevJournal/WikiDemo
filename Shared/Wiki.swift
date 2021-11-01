//
//  WikiDemoDocument.swift
//  Shared
//
//  Created by mark on 11/1/21.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var wikiDocument: UTType {
        UTType(importedAs: "com.SwiftDevJournal.wiki")
    }
}

struct Wiki: FileDocument {
    var pages: [Page] = []

    static var readableContentTypes: [UTType] { [.wikiDocument] }

    init() {
        // Creating a new wiki creates one Home page.
        let newPage = Page()
        newPage.title = "Home"
        newPage.text = "Type here"
        pages.append(newPage)
    }
    
    init(configuration: ReadConfiguration) throws {
        guard let pagesDirectory = configuration.file.fileWrappers?["Pages"] else {
            throw CocoaError(.fileReadCorruptFile)
        }
        
        if let pageFiles = pagesDirectory.fileWrappers {
            for pageFile in pageFiles {
                readPage(pageFile: pageFile.value)
            }
        }
        sortPages()
    }
    
    mutating func readPage(pageFile: FileWrapper) {
        if let filename = pageFile.filename,
           let fileData = pageFile.regularFileContents {
            
            let page = Page()
            page.title = filename
            page.read(data: fileData)
            pages.append(page)
        }
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        // Create a root directory with a Pages subdirectory containing the pages.
        let mainDirectory = FileWrapper(directoryWithFileWrappers: [:])
        let pagesDirectory = FileWrapper(directoryWithFileWrappers: [:])
        pagesDirectory.preferredFilename = "Pages"
        mainDirectory.addFileWrapper(pagesDirectory)
        
        // Add each page to the Pages folder in the file wrapper.
        for page in pages {
            if let data = page.write() {
                let wrapper = FileWrapper(regularFileWithContents: data)
                wrapper.preferredFilename = page.title
                pagesDirectory.addFileWrapper(wrapper)
            }
        }
        
        return mainDirectory
    }
    
    mutating func addPage(title: String) {
        let newPage = Page(text: "")
        newPage.title = title
        pages.append(newPage)
        sortPages()
    }
    
    mutating func removePage(title: String) {
        guard let pageIndex = pages.firstIndex(where: { page in
            page.title == title
        }) else {
            return
        }
        
        pages.remove(at: pageIndex)
    }
    
    mutating func sortPages() {
        // Sort the pages alphabetically by title.
        pages.sort {
            $0.title < $1.title
        }
    }
}
