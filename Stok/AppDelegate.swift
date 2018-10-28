//
//  AppDelegate.swift
//  Stok
//
//  Created by Zakria on 01/08/2018.
//  Copyright © 2018 Zakria. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate , NSTextFieldDelegate, NSTextDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func controlTextDidChange(notification: NSNotification) {
        let object = notification.object as! NSTextField
        NSLog("AppDelegate::controlTextDidChange")
        NSLog("field contains: \(object.stringValue)")
    }

}

