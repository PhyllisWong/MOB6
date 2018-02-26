//
//  Character.swift
//  SushiNeko
//
//  Created by Phyllis Wong on 2/25/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

/* import SpriteKit

class Character: SKSpriteNode {
    
    /* You are required to implement this for your subclass to work */
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    /* You are required to implement this for your subclass to work */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
} */

import SpriteKit

class Character: SKSpriteNode {
    
    // Chopstick objects
    var character: Character!
    
    // Character side
    var side: Side = .left {
        didSet {
            if side == .left {
                xScale = 1
                position.x = 70
            } else {
                /* An easy way to flip an asset horizontally
                is to invert the X-axis scale */
                
                // FIXME: Get help refactoring the rightChopstick
                xScale = -1
                position.x = 252
            }
        }
    }
    
    // Required to implement for the subclass to work
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    // Required to implement for the subclass to work
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}






