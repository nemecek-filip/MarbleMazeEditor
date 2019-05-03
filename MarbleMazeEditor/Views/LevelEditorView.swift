//
//  LevelEditorView.swift
//  MarbleMazeEditor
//
//  Created by Filip Němeček on 29/04/2019.
//  Copyright © 2019 Filip Němeček. All rights reserved.
//

import UIKit

class LevelEditorView: UIView {
    
    let squareSize = 50
    let columns = 16
    let rows = 12
    
    let innerColumns = 1..<15
    let innerRows = 1..<11
    
    var activeGameObject: GameObject?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initLevelContainer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initLevelContainer()
    }
    
    func getCurrentLevelString() -> String {
        
        var levelString = String()
        var currentCharacterPosition = 1
        
        let gameTiles = subviews.compactMap({ $0 as? GameTile })
        let sortedbyColumn = gameTiles.sorted { $0.column < $1.column }
        let sortedTiles = sortedbyColumn.sorted { $0.row < $1.row }
        
        for tile in sortedTiles {
            levelString.append(tile.gameObjectCode)
            if currentCharacterPosition.isMultiple(of: columns) {
                levelString.append("\n")
            }
            
            currentCharacterPosition += 1
        }
        return levelString
    }
    
    private func initLevelContainer() {
        isUserInteractionEnabled = true // So Tap gesture recognizer works
        
        for column in 0..<columns {
            
            // Top  border
            let topBorderTile = GameTile(image: GameObjects.block, gameObjectCode: "x", column: column, row: 0)
            topBorderTile.frame = CGRect(x: column * squareSize, y: 0, width: squareSize, height: squareSize)
            addSubview(topBorderTile)
            
            // Bottom border
            let bottomBorderTile = GameTile(image: GameObjects.block, gameObjectCode: "x", column: column, row: rows - 1)
            bottomBorderTile.frame = CGRect(x: column * squareSize, y: (rows - 1) * squareSize, width: squareSize, height: squareSize)
            addSubview(bottomBorderTile)
            
            // First column? Create left border
            if column == 0 {
                for row in innerRows {
                    let leftBorderTile = GameTile(image: GameObjects.block, gameObjectCode: "x", column: column, row: row)
                    leftBorderTile.frame = CGRect(x: 0, y: row * squareSize, width: squareSize, height: squareSize)
                    addSubview(leftBorderTile)
                }
            }
            
            // Last column? Create right border
            if column == columns - 1 {
                for row in innerRows {
                    let leftBorderTile = GameTile(image: GameObjects.block, gameObjectCode: "x", column: column, row: row)
                    leftBorderTile.frame = CGRect(x: (columns - 1) * 50, y: row * squareSize, width: squareSize, height: squareSize)
                    addSubview(leftBorderTile)
                }
            }
        }
        
        // Init inner squares with tappable ImageViews
        for column in innerColumns {
            for row in innerRows {
                
                let variableTile = GameTile(image: GameObjects.empty, gameObjectCode: " ", column: column, row: row)
                variableTile.frame = CGRect(x: column * squareSize, y: row * squareSize, width: squareSize, height: squareSize)
                variableTile.isUserInteractionEnabled = true
                
                let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
                variableTile.addGestureRecognizer(tapRecognizer)
                addSubview(variableTile)
            }
        }
    }
    
    @objc func imageTapped(recognizer: UITapGestureRecognizer) { 
        let view = recognizer.view
        let location = recognizer.location(in: view)
        
        if let gameTile = view?.hitTest(location, with: nil) as? GameTile {
            gameTile.configure(with: activeGameObject ?? GameObject(image: GameObjects.empty, code: " "))
        }
    }
}
