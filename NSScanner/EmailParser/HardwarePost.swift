//
//  HardwarePost.swift
//  EmailParser
//
//  Created by wonkwh on 28/01/2019.
//  Copyright © 2019 Hai Nguyen. All rights reserved.
//

import Foundation

struct HardwarePost {
  // MARK: Properties
  
    // the fields' values once extracted placed in the properties
    let email: String
    let sender: String
    let subject: String
    let date: String
    let organization: String
    let numberOfLines: Int
    let message: String

    let costs: [Double]         // cost related information
    let keywords: Set<String>   // set of distinct keywords}
    
    init(fromData data: Data) {
        let parser = Parser()
        let string = String(data: data, encoding: String.Encoding.utf8) ?? ""
        let scanner = Scanner(string: string)
        
        let metadata = scanner.scanUpTo("\n\n") ?? ""
        let (sender, email, subject, date, organization, lines) = parser.fieldsByExtractingFrom(metadata)
        
        self.sender = sender
        self.email = email
        self.subject = subject
        self.date = date
        self.organization = organization
        self.numberOfLines = lines
        
        let startIndex = string.characters.index(string.startIndex, offsetBy: scanner.scanLocation)                                               // A
        let message = string[startIndex..<string.endIndex]                      // B
        self.message = message.trimmingCharacters(in: .whitespacesAndNewlines ) // C
        
        costs = parser.costInfoByExtractingFrom(message)
        keywords = parser.keywordsByExtractingFrom(message)
    }

}


