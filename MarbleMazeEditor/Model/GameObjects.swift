//
//  GameObjects.swift
//  MarbleMazeEditor
//
//  Created by Filip Němeček on 29/04/2019.
//  Copyright © 2019 Filip Němeček. All rights reserved.
//

import UIKit

struct GameObject {
    var image: UIImage
    var code: Character
    
    static var empty : GameObject {
        return GameObject(image: GameObjects.empty, code: " ")
    }
}

enum GameObjects {
    static var block = UIImage(named: "block")!
    static var star = UIImage(named: "star")!
    static var vortex = UIImage(named: "vortex")!
    static var player = UIImage(named: "player")!
    static var finish = UIImage(named: "finish")!
    static var empty = UIImage()
}
