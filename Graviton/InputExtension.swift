//
//  inputExtension.swift
//  GravityDragger
//
//  Created by Karl Johan Krantz on 29/09/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import SpriteKit


extension GameScene {
    
    override func mouseDown(theEvent: NSEvent) {
        /* Called when a mouse click occurs */
        self.dragStartLocation = theEvent.locationInNode(self)
        
    }
    
    override func mouseDragged(theEvent: NSEvent) {
        if(!dragInProgress){
            dragInProgress = true;
        }
    }
    
    override func mouseUp(theEvent: NSEvent) {
        if(!gameManager.levelInProgress()){
            if(dragInProgress && gameManager.currentLevel.isFieldAllowed(selectedField)){
                var finishLocation = theEvent.locationInNode(self)
                let position = CGPoint(x: min(finishLocation.x, dragStartLocation.x), y: min(finishLocation.y, dragStartLocation.y))
            
                let size = CGSize(width: abs(dragStartLocation.x - finishLocation.x), height: abs(dragStartLocation.y - finishLocation.y))
            
                let fieldNode = FieldNode.createNode(size, fieldType: self.selectedField);
                fieldNode.position = position
                addChild(fieldNode)
                fieldManager.addField(fieldNode)
                nodeBeingEdited?.removeEditable()
                nodeBeingEdited = nil;
                dragInProgress = false
        	}
            else{
                let clickedNode = nodeAtPoint(theEvent.locationInNode(self));
                let parentNode = clickedNode.parent
                if let fieldNode = parentNode as? FieldNode{
                    if(nodeBeingEdited != clickedNode){
                        nodeBeingEdited?.removeEditable()
                        fieldNode.makeEditable()
                        nodeBeingEdited = fieldNode;
                    }
                }
                else{
                    nodeBeingEdited?.removeEditable()
                    nodeBeingEdited = nil;
                }
            }
        }
    }
    
    override func mouseMoved(theEvent: NSEvent) {
        if(!gameManager.levelInProgress()){
            let location = theEvent.locationInNode(self);
            let node = nodeAtPoint(location).parent;
            if let fieldNode = node as? FieldNode{
                if(hoveredNode != fieldNode){
                    hoveredNode?.removeHovered()
                    fieldNode.makeHovered()
                    hoveredNode = fieldNode;
                }
            }
            else{
                hoveredNode?.removeHovered()
                hoveredNode = nil;
            }
        }
    }
    
    override func keyDown(theEvent: NSEvent) {
        var keyCode = theEvent.character;
        switch(keyCode){
        case "d".keyCode:
            worldNode.position.x--;
        case "a".keyCode:
            worldNode.position.x++;
        case "w".keyCode:
            worldNode.position.y--;
        case "s".keyCode:
            worldNode.position.y++;
        case 32: // Spacebar
            startLevel()
        case "r".keyCode:
            gameManager.resetLevel()
            break;
        case 127:
            nodeBeingEdited?.removeFromParent()
            nodeBeingEdited = nil;
            break;
        case "1".keyCode:
            selectedField = .springField
            break;
        case "2".keyCode:
            selectedField = .gravityField
            break;
        case "3".keyCode:
            selectedField = .dragField
            break;
        default:
            break;
        }
    }
    
    
}