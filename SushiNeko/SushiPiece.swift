//
//  SushiPiece.swift
//  SushiNeko
//
//  Created by Phyllis Wong on 2/23/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//


import SpriteKit

class SushiPiece: SKSpriteNode {
    
    // Chopstick objects
    var rightChopstick: SKSpriteNode!
    var leftChopstick: SKSpriteNode!

    
    // Sushi type
    var side: Side = .none {
        didSet {
            switch side {
            case .left:
                // Show left chopstick
                leftChopstick.isHidden = false
            case .right:
                // Show right chopstick
                rightChopstick.isHidden = false
            case .none:
                // Hide all chopsticks
                leftChopstick.isHidden = true
                rightChopstick.isHidden = true
            }
        }
    }
    
    
    
    // Required init to for subclass to work
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    // Required to make the subclass work
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /*func connectChopsticks() {
        /* Connect our child chopstick nodes */
        rightChopstick = childNode(withName: "rightChopstick") as! SKSpriteNode
        leftChopstick = childNode(withName: "leftChopstick") as! SKSpriteNode
    } */
    
    func connectChopSticks() {
        // Connect our child chopstick nodes
        rightChopstick = childNode(withName: "rightChopstick") as! SKSpriteNode
        leftChopstick = childNode(withName: "leftChopstick") as! SKSpriteNode
        
        /* Set the default side */
        side = .none
    }
    
}






