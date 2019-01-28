//
//  Parser.swift
//  EmailParser
//
//  Created by wonkwh on 28/01/2019.
//  Copyright © 2019 Hai Nguyen. All rights reserved.
//

import Foundation


private extension String {
    func isMatched(_ pattern: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: self)
    }
}


final class Parser {
    
    typealias Fields = (sender: String, email: String, subject: String, date: String, organization: String, lines: Int)
    
    /// Returns a collection of predefined fields' extracted values
    func fieldsByExtractingFrom(_ string: String) -> Fields {
        var (sender, email, subject, date, organization, lines) = ("", "", "", "", "", 0)
        
        let scanner = Scanner(string: string)
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: " :\n")
        
        while !scanner.isAtEnd {
            let field = scanner.scanUpTo(":") ?? ""
            let info = scanner.scanUpTo("\n") ?? ""
            
            switch field {
            case "From":
                (email, sender) = fromInfoByExtractingFrom(info) 
            case "Subject":
                subject = info
            case "Date":
                date = info
            case "Organization":
                organization = info
            case "Lines":
                lines = Int(info) ?? 0
            
            default: break
            }
        }
        
        return (sender, email, subject, date, organization, lines)
    }
    
    fileprivate func fromInfoByExtractingFrom(_ string: String) -> (email: String, sender: String) {
        let scanner = Scanner(string: string)
        
        /*
         * ROGOSCHP@MAX.CC.Uregina.CA (Are we having Fun yet ???)
         * oelt0002@student.tc.umn.edu (Bret Oeltjen)
         * (iisi owner)
         * mbuntan@staff.tc.umn.edu ()
         * barry.davis@hal9k.ann-arbor.mi.us (Barry Davis)
         */
        if string.isMatched(".*[\\s]*\\({1}(.*)") { // A
            scanner.charactersToBeSkipped = CharacterSet(charactersIn: "() ") // B
            
            let email = scanner.scanUpTo("(")  // C
            let sender = scanner.scanUpTo(")") // D
            
            return (email ?? "", sender ?? "")
        }
        
        /*
         * "Jonathan L. Hutchison" <jh6r+@andrew.cmu.edu>
         * <BR4416A@auvm.american.edu>
         * Thomas Kephart <kephart@snowhite.eeap.cwru.edu>
         * Alexander Samuel McDiarmid <am2o+@andrew.cmu.edu>
         */
        if string.isMatched(".*[\\s]*<{1}(.*)") {
            scanner.charactersToBeSkipped = CharacterSet(charactersIn: "<> ")
            
            let sender = scanner.scanUpTo("<")
            let email = scanner.scanUpTo(">")
            
            return (email ?? "", sender ?? "")
        }
        
        return ("unknown", string)
    }
    
    func costInfoByExtractingFrom(_ string: String) -> [Double] {
        var results = [Double]()
        let dollar = CharacterSet(charactersIn: "$")
        let scanner = Scanner(string: string)
        scanner.charactersToBeSkipped = dollar
        
        while !scanner.isAtEnd && scanner.scanUpToCharacters(from: dollar, into: nil) {
            results += [scanner.scanDouble()].flatMap { $0 }
        }
        
        return results
    }
    
    let keywords: Set<String> = ["apple", "macs", "software", "keyboard",
                                 "printers", "printer", "video", "monitor",
                                 "laser", "scanner", "disks", "cost", "price",
                                 "floppy", "card", "phone"]
    
    /// Return a set of keywords extracted from
    func keywordsByExtractingFrom(_ string: String) -> Set<String> {
        var results: Set<String> = []
        let scanner = Scanner(string: string)
        
        while !scanner.isAtEnd, let word = scanner.scanUpTo(" ")?.lowercased()  {
            if keywords.contains(word) {
                results.insert(word)
            }
        }
        
        return results
    }
}
