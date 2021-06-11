//
//  AppDelegate.swift
//  Font Smoothing Bug Text
//
//  Created by Alastair Byrne on 10/06/2021.
//

import Cocoa
import WebKit

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!
    @IBOutlet var textView: NSTextView!
    @IBOutlet weak var webView: WKWebView!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        textView.string = text
        guard let html = textView.attributedString().toHtml() else {
            fatalError("Could not get HTML from attributed string.")
        }
        webView.loadHTMLString(html, baseURL: nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}
