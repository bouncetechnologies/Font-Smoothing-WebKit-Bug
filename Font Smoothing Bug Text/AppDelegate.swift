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
        // Insert code here to initialize your application
        let string = """
        Pull requests
        Issues
        Marketplace
        Explore
         
        @abyrne10
        bouncetechnologies
        /
        Font-Smoothing-Adjuster
         Unwatch
        6
         Unstar 66
         Fork
        1
        Code
        Issues
        1
        Pull requests
        Discussions
        Actions
        Projects
        1
        Wiki
        Security
        Insights
        Settings
        Edit
        New issue
        Safari 14.1 does not follow setting #14
         Open
        danilokleber opened this issue on 27 Apr · 7 comments
         Open
        Safari 14.1 does not follow setting
        #14
        danilokleber opened this issue on 27 Apr · 7 comments
        Comments
        @danilokleber
          
        danilokleber commented on 27 Apr
        Hey there. First of all, thanks for this utility!

        I noticed that Safari 14.1 started to render fonts with smoothing on some websites. The rest of the system is fine as far as right now, including Safari's interface. Another place I noticed font smoothing was in email rendering on Spark. Do you know if this has to do with some new thing regarding to HTML rendering itself?

        Feel free to close this issue if that's not applicable to the project. Thanks!
         @abyrne10
          
        Member
        abyrne10 commented on 28 Apr
        Hi @danilokleber, thank you for your comment! I'm glad you found the app useful, and thank you for flagging up the issue with Safari 14.1.

        I'll be upgrading to Big Sur 11.3 in the next few days, so I'll be able to test the issue you noticed with Safari 14.1 at that point. Do you have any websites in particular where you noticed the font smoothing preferences not being respected?
         @danilokleber
          
        Author
        danilokleber commented on 28 Apr
        Thanks for the reply @abyrne10!

        I can say that GitHub and Google results are showing this behavior. Here's a comparison with Brave for Google results if that helps. Safari is in the back with a bolder font.

        tg_image_1773996236
         @abyrne10
          
        Member
        abyrne10 commented on 28 Apr
        Thanks @danilokleber, that's helpful, I'll let you know what I find 👍
         👍 1
         @danilokleber
          
        Author
        danilokleber commented on 28 Apr
        I did some more research and found one way around it if someone wants to minimize this issue.

        https://forums.macrumors.com/threads/apple-releases-macos-big-sur-11-3-with-m1-optimizations-airtag-integration-updated-controller-support-apple-music-updates-and-more.2293343/post-29821274

        It appears to fix it only in Safari itself but already helps a lot. HTML rendering still looks off in other apps. So I guess those new macOS/Safari versions changed something under the hood.
         @leafac
          
        leafac commented on 29 Apr
        I just upgraded to macOS 11.3 with Safari 14.1 and I can confirm the issue. As mentioned, it applies not only to the browser, but other contexts in which HTML is rendered, for example, rich-text emails in Mail.app.
         @danilokleber
          
        Author
        danilokleber commented 24 days ago
        I was hoping macOS 11.3.1 would fix this, but no.
         @danilokleber
          
        Author
        danilokleber commented 12 days ago
        Same thing on macOS 11.4 unfortunately.
         @abyrne10

        Write   Preview
         


        Attach files by dragging & dropping, selecting or pasting them.
          Close issue
        Comment
        Remember, contributions to this repository should follow our GitHub Community Guidelines.
        Assignees
        No one—assign yourself
        Labels
        None yet
        Projects
        None yet
        Milestone
        No milestone
        Linked pull requests
        Successfully merging a pull request may close this issue.

        None yet
        Notifications
        Customize
         Unsubscribe
        You’re receiving notifications because you’re watching this repository.
        3 participants
        @leafac
        @danilokleber
        @abyrne10
         Lock conversation
          Pin issue
         Transfer issue
         Convert to discussion
        © 2021 GitHub, Inc.
        Terms
        Privacy
        Security
        Status
        Docs
        Contact GitHub
        Pricing
        API
        Training
        Blog
        About
        Loading complete
        """
        
        textView.string = string
        guard let html = textView.attributedString().toHtml() else {
            fatalError("Failed to create HTML from attributed string")
        }
        webView.loadHTMLString(html, baseURL: nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

extension NSAttributedString {
    func toHtml() -> String? {
        let documentAttributes = [NSAttributedString.DocumentAttributeKey.documentType: NSAttributedString.DocumentType.html]
        do {
            let htmlData = try self.data(from: NSMakeRange(0, self.length), documentAttributes:documentAttributes)
            if let htmlString = String(data:htmlData, encoding:String.Encoding.utf8) {
                return htmlString
            }
        }
        catch {
            print("error creating HTML from Attributed String")
        }
        return nil
    }
}
