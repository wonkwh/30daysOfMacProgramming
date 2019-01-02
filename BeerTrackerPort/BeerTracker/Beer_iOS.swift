//
//  Beer_iOS.swift
//  BeerTracker
//
//  Created by wonkwh on 02/01/2019.
//  Copyright © 2019 Ray Wenderlich. All rights reserved.
//

import UIKit

// MARK: - Image Saving
extension Beer: BeerImage {
    typealias Image = UIImage
    
    func beerImage() -> Image? {
        guard let imagePath = imagePath,
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
                return #imageLiteral(resourceName: "beerMugPlaceholder")
        }
        
        let pathName = (path as NSString).appendingPathComponent("BeerTracker/\(imagePath)")
        guard let image = Image(contentsOfFile: pathName) else { return #imageLiteral(resourceName: "beerMugPlaceholder") }
        return image
    }
    
    func saveImage(_ image: Image) {
        guard let imgData = UIImageJPEGRepresentation(image, 0.5),
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
                return
        }
        
        let appPath = (path as NSString).appendingPathComponent("/BeerTracker")
        let fileName = "\(UUID().uuidString).jpg"
        let pathName = (appPath as NSString).appendingPathComponent(fileName)
        var isDirectory: ObjCBool = false
        if !FileManager.default.fileExists(atPath: appPath, isDirectory: &isDirectory) {
            do {
                try FileManager.default.createDirectory(atPath: pathName, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("Failed to create directory: \(error)")
            }
        }
        if (try? imgData.write(to: URL(fileURLWithPath: pathName), options: [.atomic])) != nil {
            imagePath = fileName
        }
    }
}
