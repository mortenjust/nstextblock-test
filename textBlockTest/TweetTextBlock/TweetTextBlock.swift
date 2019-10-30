//
//  TweetTextBlock.swift
//  textBlockTest
//
//  Created by Morten Just on 10/29/19.
//  Copyright © 2019 Morten Just. All rights reserved.
//

import Cocoa

class TweetTextBlock: NSTextBlock {
    
    override init() {
        super.init()
        setWidth(33.0, type: .absoluteValueType, for: .padding)
        setWidth(70.0, type: .absoluteValueType, for: .padding, edge: .minX)
        
        setValue(100, type: .absoluteValueType, for: .minimumHeight)
        
        setValue(300, type: .absoluteValueType, for: .width)
        setValue(590, type: .absoluteValueType, for: .maximumWidth)
        
        
        backgroundColor = NSColor(white: 0.97, alpha: 1.0)
        
    }
    
    
    override func drawBackground(withFrame frameRect: NSRect, in controlView: NSView,
        characterRange charRange: NSRange, layoutManager: NSLayoutManager) {
        
        let frame = frameRect
        let fo = frameRect.origin
        
        super.drawBackground(withFrame: frame, in: controlView, characterRange:
        charRange, layoutManager: layoutManager)

        // draw string
        let context = NSGraphicsContext.current
        context?.shouldAntialias = true
        
        let drawPoint: NSPoint = CGPoint(x: fo.x + 70, y: fo.y + 10)
        
        
        let nameAttributes = [AttKey.font: NSFont(name: "HelveticaNeue-Bold", size: 15),  .foregroundColor: NSColor.black]
        var handleAttributes = [AttKey.font: NSFont(name: "HelveticaNeue", size: 15),  .foregroundColor: NSColor(red: 0.3936756253, green: 0.4656872749, blue: 0.5323709249, alpha: 1)]
        
        let nameAStr = NSMutableAttributedString(string: "Johanna Appleseed", attributes: nameAttributes)
        let handleAStr = NSAttributedString(string: "  @johappleseed ·  3h", attributes: handleAttributes)
        nameAStr.append(handleAStr)
        nameAStr.draw(at: drawPoint)
        
        let im = NSImage(named: "profile-twitter")!
        im.draw(in: NSRect(x: fo.x + 10, y: fo.y + 10, width: 50, height: 50))
        
        }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
