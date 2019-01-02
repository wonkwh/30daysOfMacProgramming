//
//  Beer_Mac.swift
//  BeerTracker-Mac
//
//  Created by wonkwh on 02/01/2019.
//  Copyright © 2019 Ray Wenderlich. All rights reserved.
//


import AppKit

// MARK: - Image Saving
extension Beer: BeerImage {
    typealias Image = NSImage
    
    func beerImage() -> Image? {
        guard let imagePath = imagePath,
            let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first else {
                return #imageLiteral(resourceName: "beerMugPlaceholder")
        }
        let pathName = (path as NSString).appendingPathComponent(imagePath)
        guard let image = Image(contentsOfFile: pathName) else { return #imageLiteral(resourceName: "beerMugPlaceholder") }
        return image
    }
    
    func saveImage(_ image: Image) {
        guard let imgData = image.tiffRepresentation,
            let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first else {
                return
        }
        
        let fileName = "/BeerTracker/\(UUID().uuidString).jpg"
        let pathName = (path as NSString).appendingPathComponent(fileName)
        if (try? imgData.write(to: URL(fileURLWithPath: pathName), options: [.atomic])) != nil {
            imagePath = fileName
        }
    }
}
