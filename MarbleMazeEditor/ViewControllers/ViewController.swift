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
        levelContainer.activeGameObject = GameObject.empty
    }
    
    func showAlert(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }

    @IBAction func gameObjectSegment_Changed(_ sender: UISegmentedControl) {
        let selectedGameObject = GameObjectSegments(rawValue: sender.selectedSegmentIndex)!
        
        // probably could use some refactoring
        switch selectedGameObject {
        case .wall:
            levelContainer.activeGameObject = GameObject(image: GameObjects.block, code: "x")
        case .vortex:
            levelContainer.activeGameObject = GameObject(image: GameObjects.vortex, code: "v")
        case .star:
            levelContainer.activeGameObject = GameObject(image: GameObjects.star, code: "s")
        case .finish:
            levelContainer.activeGameObject = GameObject(image: GameObjects.finish, code: "f")
        case .player:
            levelContainer.activeGameObject = GameObject(image: GameObjects.player, code: "p")
        case .empty:
            levelContainer.activeGameObject = GameObject.empty
        }
    }
    
    @IBAction func exportButtonTapped(_ sender: UIButton) {
        let levelString = levelContainer.getCurrentLevelString()
        
        // create file?
        let exporter = FileExporter()
        
        guard let fileURL = exporter.exportLevelToFile(levelString: levelString, filename: "awesomeLevel.txt") else {
            showAlert(title: "Error", message: "There was a problem saving the file")
            return
        }
        
        let ac = UIActivityViewController(activityItems: [fileURL], applicationActivities: nil)
        ac.popoverPresentationController?.sourceView = sender
        ac.popoverPresentationController?.sourceRect = sender.bounds
        ac.popoverPresentationController?.permittedArrowDirections = .right
        
        present(ac, animated: true, completion: nil)
        
    }
    

}

