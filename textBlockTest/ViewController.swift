//
//  ViewController.swift
//  textBlockTest
//
//  Created by Morten Just on 10/27/19.
//  Copyright © 2019 Morten Just. All rights reserved.
//

import Cocoa

typealias AttKey = NSAttributedString.Key



class ViewController: NSViewController {
    
    @IBOutlet var textView: NSTextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func markTweet(_ sender : Any?){
        print("now we are marking")
        let location = textView.selectedRange().location
        
        
        guard let nsRange = textView.string.extractRange(by: .byParagraphs, at: location) else { print("Not in a paragraph"); return }
        
        let substring = (textView.string as NSString).substring(with: nsRange)
        
        print("the paragraph is \(substring)")
        
        // now we can apply our textBox layout
        
        let tweetParagraph = NSMutableParagraphStyle()
//        tweetParagraph.setParagraphStyle(NSParagraphStyle.default)
        tweetParagraph.textBlocks = [TweetTextBlock()]
        
        let twitterAttributes : [AttKey : Any] = [
            AttKey.paragraphStyle : tweetParagraph,
            AttKey.font : NSFont(name: "HelveticaNeue", size: 15)
        ]
        
        textView.textStorage?.addAttributes(twitterAttributes, range: nsRange)
    }
    

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension String {
    subscript(_ range: CountableRange<Int>) -> String {
        let idx1 = index(startIndex, offsetBy: max(0, range.lowerBound))
        let idx2 = index(startIndex, offsetBy: min(self.count, range.upperBound))
        return String(self[idx1..<idx2])
    }
}




extension String {
    func extractRange(by option: NSString.EnumerationOptions, at location: Int) -> NSRange? {
        let ns = self as NSString
        let r = NSRange(location: 0, length: ns.length)
        var found : NSRange?
        ns.enumerateSubstrings(in: r, options: [option]) { (string, range, _, _) in
            if NSLocationInRange(location, range){
                found = range
            }
        }
        return found
    }
}
