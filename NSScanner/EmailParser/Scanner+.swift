//
//  Scanner+.swift
//  EmailParser
//
//  Created by wonkwh on 28/01/2019.
//  Copyright © 2019 Hai Nguyen. All rights reserved.
//

import Foundation

extension Scanner {
  
  func scanUpToCharactersFrom(_ set: CharacterSet) -> String? {
    var result: NSString?
    return scanUpToCharacters(from: set, into: &result) ? (result as String?) : nil 
  }
  
  func scanUpTo(_ string: String) -> String? {
    var result: NSString?
    return self.scanUpTo(string, into: &result) ? (result as String?) : nil
  }
  
  func scanDouble() -> Double? {
    var double: Double = 0
    return scanDouble(&double) ? double : nil
  }
}
