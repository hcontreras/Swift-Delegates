//
//  SecondaryWindowController.swift
//  Delegate
//
//  Created by Humberto Contreras on 01/04/16.
//  Copyright © 2016 Humberto Contreras. All rights reserved.
//

import Cocoa

protocol SecondaryWindowDelegate {
    func registryActivity(message: String)
    func registryWindowActivity(message: String, windowClosed: Bool)
    func setProgressBarFunction(value: Double)
}

class SecondaryWindowController: NSWindowController {
    
    var delegate: SecondaryWindowDelegate?
    var count: Int = 0
    
    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        self.window?.title = "Secondary Window"
    }
    
    
    @IBAction func setValue(sender: AnyObject) {
        let slider: NSSlider = sender as! NSSlider
        delegate?.setProgressBarFunction(slider.doubleValue)
    }
    
    
    @IBAction func activity(sender: AnyObject) {
        count += 1
        delegate?.registryActivity("---> EL BOTÓN EN MAIN WINDOW HA SIDO PRESIONADO \(count) VECES.")
        print("Activity in Secondary Window")
    }

    @IBAction func closeWindow(sender: AnyObject) {
        self.window?.close()
        delegate?.registryWindowActivity("--> LA VENTANA 2 HA SIDO CERRADA", windowClosed: true)
        print("Secondary Window closed")
    }
}
