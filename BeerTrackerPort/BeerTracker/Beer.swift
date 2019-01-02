/**
 * Copyright (c) 2017 Razeware LLC
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
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import Foundation

protocol BeerImage {
  associatedtype Image
  func saveImage(_ image:Image)
  func beerImage() -> Image?
}

final class Beer: NSObject, NSCoding {
  
  // MARK: Keys
  enum Keys: String {
    case Name = "name"
    case Rating = "rating"
    case ImagePath = "image"
    case Note = "note"
  }
  
  // MARK: - Properties
  var name: String
  var rating: Int
  var imagePath: String?
  var note: String?
  
  // MARK: - Initializers
  override init() {
    name = ""
    rating = 1
    super.init()
  }
  
  init(name: String, imagePath: String? = nil, note: String?, rating: Int) {
    self.name = name
    self.imagePath = imagePath
    self.note = note
    self.rating = rating
    super.init()
  }
  
  // MARK: - NSCoding
  required init?(coder aDecoder: NSCoder) {
    name = aDecoder.decodeObject(forKey: Keys.Name.rawValue) as! String
    rating = (aDecoder.decodeObject(forKey: Keys.Rating.rawValue) as! NSNumber).intValue
    imagePath = aDecoder.decodeObject(forKey: Keys.ImagePath.rawValue) as? String
    note = aDecoder.decodeObject(forKey: Keys.Note.rawValue) as? String
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: Keys.Name.rawValue)
    aCoder.encode(NSNumber(value: rating), forKey: Keys.Rating.rawValue)
    aCoder.encode(imagePath, forKey: Keys.ImagePath.rawValue)
    aCoder.encode(note, forKey: Keys.Note.rawValue)
  }
}

