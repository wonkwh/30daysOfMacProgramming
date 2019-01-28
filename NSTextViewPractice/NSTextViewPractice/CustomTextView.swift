//
//  CustomTextView.swift
//  NSTextViewPractice
//
//  Created by wonkwh on 28/01/2019.
//  Copyright © 2019 wonkwh. All rights reserved.
//

import Cocoa

class CustomTextView: NSTextView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    override func insertTab(_ sender: Any?) {
        super.insertTab(sender)
        print(selectedRange())
        
        if let (_, range) = paragraphAndRange(selectedRange()) {
            string.distance(from: range, to: <#T##String.Index#>)
            let startRange = NSMakeRange(string!.startIndex.distanceTo(range.startIndex), 0)
            insertText("- ", replacementRange: startRange)
        }

    }
    
    override func insertBacktab(_ sender: Any?) {
        print("backtap")
    }
    
    private func paragraphAndRange(_ range: NSRange) -> (String, Range<String.Index>)? {
        if string.isEmpty == false {
            let r = range.stringRangeForText(string)
            
            let paragraphRange = string.paragraphRange(for: r)
            let paragraphString = string.substring(with: paragraphRange)
            
            return (paragraphString, paragraphRange)
        } else {
            return nil
        }
    }
}

/*
override func insertTab(sender: AnyObject?) {
    Swift.print("insertTab")
    
    //super.insertTab(sender)
    Swift.print(selectedRange())
    if let (_, range) = paragraphAndRange(selectedRange()) {
        let startRange = NSMakeRange(string!.startIndex.distanceTo(range.startIndex), 0)
        insertText("- ", replacementRange: startRange)
    }
    
    
}

override func insertBacktab(sender: AnyObject?) {
    Swift.print("insertBacktab")
    
    if let (_, range) = paragraphAndRange(selectedRange()) {
        let loc = string!.startIndex.distanceTo(range.startIndex)
        let bulletRange = NSMakeRange(loc, 2)
        
        replaceCharactersInRange(bulletRange, withString: "")
    }
}
*/

// MARK: - Helpers


extension NSRange {
    func stringRangeForText(_ string: String) -> Range<String.Index> {
//        let start = string.startIndex.
//        let start = string.startIndex.advanced(by: self.location)
//        let end = start.advanced(by:self.length)
//        return start..<end
    }
}
