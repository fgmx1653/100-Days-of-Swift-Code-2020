//
//  AppDelegate.swift
//  2D Game macOS
//
//  Created by Caleb Wells on 4/24/20.
//  Copyright © 2020 Caleb Wells. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var window: NSWindow?
    
    override init() {
        super.init()
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let contentView = GameViewController()
        
        window = NSWindow(
        contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
        styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
        backing: .buffered, defer: false)
        window?.center()
        window?.contentView?.addSubview(contentView.view)
        window?.makeKeyAndOrderFront(nil)
        
        
        
        
//        window.setFrameAutosaveName("Main Window")
//        window.contentView = NSHostingView(rootView: contentView)
//        window.makeKeyAndOrderFront(nil)
    }
}
