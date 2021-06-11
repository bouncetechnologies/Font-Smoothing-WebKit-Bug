//
//  Extensions.swift
//  Font Smoothing Bug Text
//
//  Created by Alastair Byrne on 11/06/2021.
//

import Foundation

extension NSAttributedString {
    func toHtml() -> String? {
        let documentAttributes = [NSAttributedString.DocumentAttributeKey.documentType: NSAttributedString.DocumentType.html]
        do {
            let htmlData = try self.data(from: NSMakeRange(0, self.length), documentAttributes:documentAttributes)
            if let htmlString = String(data:htmlData, encoding:String.Encoding.utf8) {
                return htmlString
            } else {
                fatalError("Could not get HTML string from HTML data.")
            }
        }
        catch {
            fatalError("Could not get HTML data from attributed string.")
        }
    }
}
