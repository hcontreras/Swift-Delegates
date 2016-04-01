//
//  AppDelegate.swift
//  Delegate
//
//  Created by Humberto Contreras on 01/04/16.
//  Copyright © 2016 Humberto Contreras. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, SecondaryWindowDelegate {

    @IBOutlet weak var window: NSWindow!
    
    @IBOutlet weak var progress: NSProgressIndicator!
    
    var secondaryWindow: SecondaryWindowController = SecondaryWindowController(windowNibName: "SecondaryWindow")

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        self.window.title = "Protocols & Delegates"
        secondaryWindow.delegate = self
        self.setProgressBarFunction(0.0)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBAction func openSecondaryWindow(sender: AnyObject) {
        secondaryWindow.showWindow(self)
    }
    
    func registryActivity(message: String){
        print("Mensaje enviado desde otra ventana: \(message)")
    }
    
    func registryWindowActivity(message: String, windowClosed: Bool){
        print("Mensaje enviado desde otra ventana: \(message) ¿Se ha cerrado la ventana?: \(windowClosed)")
    }
    
    func setProgressBarFunction(value: Double){
        self.progress.doubleValue = value
    }

}

