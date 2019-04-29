//
//  ViewController.swift
//  MarbleMazeEditor
//
//  Created by Filip Němeček on 28/04/2019.
//  Copyright © 2019 Filip Němeček. All rights reserved.
//

import UIKit

enum GameObjectSegments: Int {
    case wall
    case vortex
    case star
    case finish
    case player
    case empty
}

class ViewController: UIViewController {
    
    @IBOutlet var levelContainer: LevelEditorView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        levelContainer.activeGameObject = GameObjects.empty
    }

    @IBAction func gameObjectSegment_Changed(_ sender: UISegmentedControl) {
        let selectedGameObject = GameObjectSegments(rawValue: sender.selectedSegmentIndex)!
        
        // probably could use some refactoring
        switch selectedGameObject {
        case .wall:
            levelContainer.activeGameObject = GameObjects.block
        case .vortex:
            levelContainer.activeGameObject = GameObjects.vortex
        case .star:
            levelContainer.activeGameObject = GameObjects.star
        case .finish:
            levelContainer.activeGameObject = GameObjects.finish
        case .player:
            levelContainer.activeGameObject = GameObjects.player
        case .empty:
            levelContainer.activeGameObject = GameObjects.empty
        }
    }
    
    @IBAction func exportButtonTapped(_ sender: UIButton) {
        let levelString = levelContainer.getCurrentLevelString()
        
        // create file?
        let exporter = FileExporter()
        
        let fileURL = exporter.exportLevelToFile(levelString: levelString, filename: "awesomeLevel.txt")
        
        let ac = UIActivityViewController(activityItems: [fileURL], applicationActivities: nil)
        ac.popoverPresentationController?.sourceView = sender
        ac.popoverPresentationController?.sourceRect = sender.bounds
        ac.popoverPresentationController?.permittedArrowDirections = .right
        
        present(ac, animated: true, completion: nil)
        
    }
    

}

