//
//  FileExporter.swift
//  MarbleMazeEditor
//
//  Created by Filip Němeček on 29/04/2019.
//  Copyright © 2019 Filip Němeček. All rights reserved.
//

import Foundation

class FileExporter {
    func exportLevelToFile(levelString: String, filename: String = "level.txt") -> URL? {
        let fileURL = getDocumentsDirectory().appendingPathComponent(filename)
        do {
            try levelString.write(to: fileURL, atomically: true, encoding: .utf8)
            return fileURL
        } catch {
            print("Failed to save file: \(error.localizedDescription)")
            return nil
        }
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
