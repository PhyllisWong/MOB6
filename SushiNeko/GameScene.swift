//
//  GameScene.swift
//  SushiNeko
//
//  Created by Phyllis Wong on 2/23/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import SpriteKit


/* Tracking enum for use with character and sushi side */
enum Side {
    case left
    case right
    case none
}

class GameScene: SKScene {
    
    /* Game objects */
    var sushiBasePiece: SushiPiece!
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        // Connect game objects
        sushiBasePiece = childNode(withName: "sushiBasePiece") as! SushiPiece

        // Setup chopsticks connection
        sushiBasePiece.connectChopSticks()
    }
    
}
