//
//  ViewController.swift
//  BabyScript
//
//  Created by wonkwh on 28/01/2019.
//  Copyright © 2019 wonkwh. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var text: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text.toggleRuler(nil)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func showWordCountWindow(_ sender: AnyObject) {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let wordCountWindowController = storyboard.instantiateController(withIdentifier: "WordCountWindowController") as! NSWindowController
        
        if let wordCountWindow = wordCountWindowController.window, let textStorage = text.textStorage {
            let wordCountViewController = wordCountWindow.contentViewController as! WordCountViewController
            wordCountViewController.wordCount = textStorage.words.count
            wordCountViewController.paragraphCount = textStorage.paragraphs.count

            NSApplication.shared.runModal(for: wordCountWindow)
            wordCountWindow.close()
        }
    }


}

