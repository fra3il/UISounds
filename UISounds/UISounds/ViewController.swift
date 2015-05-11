//
//  ViewController.swift
//  UISounds
//
//  Created by MinhaSeong on 2015. 5. 6..
//  Copyright (c) 2015년 fra3il. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        extrectFiles()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: Private
private extension ViewController {
    func extrectFiles() {
        let fileManager = NSFileManager.defaultManager()
        let documentPath = documentDirectory()

        fileManager.removeItemAtPath(documentPath, error: nil)

        let fromPaths = ["System/Library/Audio/UISounds/", "Library/Ringtones/"]
        for fromPath in fromPaths {
            let toPath = documentPath.stringByAppendingPathComponent(fromPath.lastPathComponent)

            var error: NSError?
            if fileManager.copyItemAtPath(fromPath, toPath: toPath, error: &error) {
                NSLog("\(toPath)")
            } else {
                NSLog("\(toPath)\n\(error)")
            }
        }
    }

    func documentDirectory() -> String {
        let fileManager = NSFileManager.defaultManager()
        let documentDirectories:NSArray = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)

        return documentDirectories.firstObject as! String
    }
}
