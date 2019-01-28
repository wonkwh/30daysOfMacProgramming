/*
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import Cocoa

final class PostCell: NSTableCellView {

  // MARK: IBOulet

  @IBOutlet weak var senderLabel: NSTextField!
  @IBOutlet weak var emailLabel: NSTextField!
  @IBOutlet weak var dateLabel: NSTextField!
  @IBOutlet weak var subjectLabel: NSTextField!
  @IBOutlet weak var organizationLabel: NSTextField!
  @IBOutlet weak var costLabel: NSTextField!
  @IBOutlet weak var keywordsLabel: NSTextField!
  @IBOutlet weak var numberOfLinesLabel: NSTextField!
  
  func configure(_ post: HardwarePost) {
    
    senderLabel.stringValue = post.sender
    emailLabel.stringValue = post.email
    dateLabel.stringValue = post.date
    subjectLabel.stringValue = post.subject
    organizationLabel.stringValue = post.organization
    numberOfLinesLabel.stringValue = "\(post.numberOfLines)"
    
    // 1.
    costLabel.stringValue = post.costs.isEmpty ? "NO" :
      post.costs.map { "\($0)" }.lazy.joined(separator: "; ")
    
    // 2.
    keywordsLabel.stringValue = post.keywords.isEmpty ? "No keywords found" :
      post.keywords.joined(separator: "; ")
  }

}
