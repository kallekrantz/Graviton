//
//  AppDelegate.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 29/09/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//


import Cocoa
import SpriteKit

extension SKNode {
    class func unarchiveFromFile(file : NSString) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            var sceneData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)!
            var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as GameScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var skView: SKView!
    
    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        /* Pick a size for the scene */
        
        if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            window.acceptsMouseMovedEvents = true;
            window.makeFirstResponder(self.skView.scene)
            
            self.skView!.presentScene(scene)
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            self.skView!.ignoresSiblingOrder = true
        }
        
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true
    }
}
