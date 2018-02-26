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
    
    // MARK: Game objects
    var sushiBasePiece: SushiPiece!
    var character: Character!
    
    // Sushi tower array
    var sushiTower: [SushiPiece] = []
    
    
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        // Connect game objects
        sushiBasePiece = childNode(withName: "sushiBasePiece") as! SushiPiece
        character = childNode(withName: "character") as! Character

        // Setup chopsticks connection
        sushiBasePiece.connectChopSticks()

        // Manually stack the start of the tower
        addTowerPiece(side: .none)
        addTowerPiece(side: .right)
        
        // Add a random number of sushi pieces to the tower
        addRandomPieces(total: 10)
    }

    
    func addTowerPiece(side: Side) {
        // Add a new sushi piece to the susho tower
        
        // Copy original sushi piece
        let newPiece = sushiBasePiece.copy() as! SushiPiece
        newPiece.connectChopSticks()
        
        // Access last piece properties
        let lastPiece = sushiTower.last
        
        // Add on top of last piece, default on first piece
        let lastPosition = lastPiece?.position ?? sushiBasePiece.position
        newPiece.position.x = lastPosition.x
        newPiece.position.y = lastPosition.y + 55
        
        /* Increment Z to ensure it's on top of the last piece
        Default on first piece */
        
        let lastZPosition = lastPiece?.zPosition ?? sushiBasePiece.zPosition
        newPiece.zPosition = lastZPosition + 1
        
        // Set side
        newPiece.side = side
        
        // Add sushi to the scene
        addChild(newPiece)
        
        // Add sushi piece to the sushi tower
        sushiTower.append(newPiece)
    }

    
    func addRandomPieces(total: Int) {
        // Add random sushi pieces to the sushi tower
        
        for _ in 1...total {
            // Need to access last piece properties
            let lastPiece = sushiTower.last!
            
            // Need to ensure we don't create impossible sushi structures
            if lastPiece.side != .none {
                addTowerPiece(side: .none)
            } else {
                
                // Random Number Generator
                let rand = arc4random_uniform(100)
                
                if rand < 45 {
                    // 45% chance of a left piece
                    addTowerPiece(side: .left)
                } else if rand < 90 {
                    // 45% chance of a right piece
                    addTowerPiece(side: .right)
                } else {
                    // 10% chance of an empty piece
                    addTowerPiece(side: .none)
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Call when a touch begins
        
        // We only need a single touch
        let touch = touches.first
        
        // Get touch position in scene
        let location = touch!.location(in: self)
        
        // Check if touch was on left/right hand side of screen
        if location.x > size.width / 2 {
            character.side = .right
        } else {
            character.side = .left
        }
 
        // Grab sushi piece on top of the base sushi piece, it'll always be 'first'
        if let firstPiece = sushiTower.first {
            /* Remove from sushi tower array */
            sushiTower.removeFirst()
            
            // Animate the punched sushi piece
            firstPiece.flip(character.side)
            
            /* Add a new sushi piece to the top of the sushi tower */
            addRandomPieces(total: 1)
        }
    }

    
    func moveTowerDown() {
        var n: CGFloat = 0
        
        for piece in sushiTower {
            let y = (n * 55) + 215
            piece.position.y -= (piece.position.y - y) * 0.5
            n += 1
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        moveTowerDown()
    }
    
}







