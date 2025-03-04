# WikiDemo

A multiplatform SwiftUI project demonstrating various SwiftUI features, including creating a master-detail interface. It's a multiplatform version of the [MacWikiDemo project](https://github.com/SwiftDevJournal/MacWikiDemo). I use this project as a sample project in the following articles:

* [Creating a Master-Detail Inteface in SwiftUI](https://www.swiftdevjournal.com/creating-a-master-detail-inteface-in-swiftui/)
* [Passing Data to SwiftUI Views](https://www.swiftdevjournal.com/passing-data-to-swiftui-views/)
* [Using File Wrappers in a SwiftUI App](https://www.swiftdevjournal.com/using-file-wrappers-in-a-swiftui-app/)
* [Removing Items from SwiftUI Lists in Mac Apps](https://www.swiftdevjournal.com/removing-items-from-swiftui-lists-in-mac-apps/)
* [Disable a Text Field in a SwiftUI List Until Tapping Edit Button](https://www.swiftdevjournal.com/disable-a-text-field-in-a-swiftui-list-until-tapping-edit-button/)
* [Using a UIKit or AppKIt View in SwiftUI](https://www.swiftdevjournal.com/using-a-uikit-or-appkit-view-in-swiftui/)

The master view shows a list of pages. Select a page to show the page's contents in the detail view.

The detail view has two views: a text view where you type Markdown and a web view that shows HTML.

## System Requirements

* Xcode 13.0+ for iOS version
* Xcode 13.1+ for Mac version
* iOS 14+
* macOS 11+

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

* The `ContentView.swift` and `PageListView.swift` files have the code for creating a master-detail interface.
* The `Wiki.swift` and `Page.swift` files have the code for working with file wrappers.
* The `PageListView.swift` and `Wiki.swift` files have the code for list item removal.
* The `PageListView.swift` file in the iOS folder has code for disabling the text fields in the page list until someone taps the Edit button on iOS.
* The `WebView.swift` files in the iOS and Mac folders have code for wrapping UIKit and AppKit views to use in a SwiftUI app.

## Navigation Split View Version

The `ios17` branch contains a version of the app that uses the Observation framework and uses `NavigationSplitView` instead of the deprecated `NavigationView`. This version requires iOS 17+ for the iOS version and macOS 14+ for the Mac version. You must be running Xcode 15+ to edit this version on your Mac.

This version is a work in progress. The iOS version has a selection bug where selecting a page from the page list sets the selection to nil. You have to select the page a second time to view and edit its contents in the detail view.

## Credits

This project uses the [Ink Markdown parser](https://github.com/JohnSundell/Ink) by John Sundell.
