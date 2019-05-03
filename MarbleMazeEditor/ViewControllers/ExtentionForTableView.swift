//
//  ExtentionForTableView.swift
//  MarbleMazeEditor
//
//  Created by Ayane on 5/1/19.
//  Copyright © 2019 Filip Němeček. All rights reserved.
//

import UIKit


extension LevelsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return levelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row) level"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            
            levelArray.remove(at: indexPath.row)
            rowIndex = nil
            myTextView.text = ""
            //myTableView.deleteRows(at: [indexPath], with: .automatic)
            myTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTextView.text = levelArray[indexPath.row]
        rowIndex = indexPath.row
    }
}
