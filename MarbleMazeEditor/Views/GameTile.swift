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
    var column: Int = 0
    var row: Int = 0
    
    init(image: UIImage?, gameObjectCode: Character, column: Int, row: Int) {
        super.init(image: image)
        self.gameObjectCode = gameObjectCode
        self.column = column
        self.row = row
    }
    
    func configure(with gameObject: GameObject) {
        image = gameObject.image
        gameObjectCode = gameObject.code
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
