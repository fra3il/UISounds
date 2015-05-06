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

        extractFiles()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Private
    func extractFiles() {
        let fileManager = NSFileManager.defaultManager()
        let filePaths = ["System/Library/Audio/UISounds/", "Library/Ringtones/"]

        if let documentPaths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) {
            let documentPath = documentPaths.first as! String

            fileManager.removeItemAtPath(documentPath, error: nil)

            for filePath in filePaths {
                let toPath = documentPath.stringByAppendingPathComponent(filePath.lastPathComponent)

                if fileManager.copyItemAtPath(filePath, toPath: toPath, error: nil) {
                    NSLog("\(toPath)")
                }
            }
        }
    }
}

