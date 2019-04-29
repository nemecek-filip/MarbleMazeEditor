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
    
    var activeGameObject: UIImage?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initLevelContainer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initLevelContainer()
    }
    
    func getCurrentLevelString() -> String {
        return "implementation needed :-)"
    }
    
    private func initLevelContainer() {
        isUserInteractionEnabled = true // So Tap gesture recognizer works
        
        let blockImage = UIImage(named: "block")!
        for column in 0..<columns {
            
            // Top  border
            let topBorderTile = UIImageView(image: GameObjects.block)
            topBorderTile.frame = CGRect(x: column * squareSize, y: 0, width: squareSize, height: squareSize)
            addSubview(topBorderTile)
            
            // Bottom border
            let bottomBorderTile = UIImageView(image: blockImage)
            bottomBorderTile.frame = CGRect(x: column * squareSize, y: (rows - 1) * squareSize, width: squareSize, height: squareSize)
            addSubview(bottomBorderTile)
            
            // First column? Create left border
            if column == 0 {
                for row in innerRows {
                    let leftBorderTile = UIImageView(image: blockImage)
                    leftBorderTile.frame = CGRect(x: 0, y: row * squareSize, width: squareSize, height: squareSize)
                    addSubview(leftBorderTile)
                }
            }
            
            // Last column? Create right border
            if column == columns - 1 {
                for row in innerRows {
                    let leftBorderTile = UIImageView(image: blockImage)
                    leftBorderTile.frame = CGRect(x: (columns - 1) * 50, y: row * squareSize, width: squareSize, height: squareSize)
                    addSubview(leftBorderTile)
                }
            }
        }
        
        // Init inner squares with tappable ImageViews
        for column in innerColumns {
            for row in innerRows {
                let variableTile = UIImageView(image: GameObjects.empty)
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
        
        if let imageView = view?.hitTest(location, with: nil) as? UIImageView {
            imageView.image = activeGameObject
        }
        
    }

}
