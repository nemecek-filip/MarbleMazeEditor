//
//  GameTile.swift
//  MarbleMazeEditor
//
//  Created by Filip Němeček on 29/04/2019.
//  Copyright © 2019 Filip Němeček. All rights reserved.
//

import UIKit

class GameTile: UIImageView {

    private(set) var gameObjectCode: Character = " "
    
    init(image: UIImage?, gameObjectCode: Character) {
        super.init(image: image)
        self.gameObjectCode = gameObjectCode
    }
    
    func configure(with gameObject: GameObject) {
        image = gameObject.image
        gameObjectCode = gameObject.code
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
