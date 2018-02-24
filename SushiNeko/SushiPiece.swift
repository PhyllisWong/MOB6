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
    
    // Required init to for subclass to work
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    // Required to make the subclass work
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}






