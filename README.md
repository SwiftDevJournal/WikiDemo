# WikiDemo

A multiplatform SwiftUI project demonstrating various SwiftUI features, including creating a master-detail interface. It's a multiplatform version of the [MacWikiDemo project](https://github.com/SwiftDevJournal/MacWikiDemo). I use this project as a sample project in the following articles:

* [Creating a Master-Detail Inteface in SwiftUI](https://www.swiftdevjournal.com/creating-a-master-detail-inteface-in-swiftui/)
* [Using File Wrappers in a SwiftUI App](https://www.swiftdevjournal.com/using-file-wrappers-in-a-swiftui-app/)
* [Removing Items from SwiftUI Lists in Mac Apps](https://www.swiftdevjournal.com/removing-items-from-swiftui-lists-in-mac-apps/)

The master view shows a list of pages. Select a page to show the page's contents in the detail view.

The detail view has two views: a text view where you type Markdown and a web view that shows HTML.

## System Requirements

* Xcode 13.0+ on iOS, Xcode 13.1 on Mac
* iOS 14+, macOS 11+

## Adding Pages

Click the Add button at the bottom of the list to add a new page.

## Renaming Pages

### iOS

Tap the Edit button. Tap on the name of a page to rename it.

### Mac

Select the page from the sidebar and press the Return key to rename the page.

I find that with SwiftUI that all you have to do is select the page to change the page name. I consider it a bug.

## Deleting Pages

### iOS

Tap the Edit button. Tap the minus button next to the page you want to remove. Tap the Delete button to finish deleting.

### Mac

Select the page and press the Delete key to delete a page.

You may have to press the Esc key afer selecting the page to select the page instead of renaming it.

## Interesting Files

The `ContentView.swift` and `PageListView.swift` files have the code for creating a master-detail interface.

The `Wiki.swift` and `Page.swift` files have the code for working with file wrappers.

The `PageListView.swift` and `Wiki.swift` files have the code for list item removal.

