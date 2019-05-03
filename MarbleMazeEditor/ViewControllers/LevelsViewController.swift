//
//  LevelsViewController.swift
//  MarbleMazeEditor
//
//  Created by Ayane on 5/1/19.
//  Copyright © 2019 Filip Němeček. All rights reserved.
//

import UIKit
var levelArray = [String]()

class LevelsViewController:
UIViewController, UITextViewDelegate {
    
    var rowIndex: Int?
    var presentedFromSaveButton = false
    
    @IBOutlet weak var myTextView: UITextView!
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        if presentedFromSaveButton{
            myTextView.text = levelArray.last
            presentedFromSaveButton = false
        }
        myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTextView.delegate = self
        self.edgesForExtendedLayout = []//to show tabbar
        
    }
    
    
    
    @IBAction func Back(_ sender: UIButton) {
        print(levelArray.count)
        if let tabbarVC = storyboard?.instantiateViewController(withIdentifier: "tabbar") as? UITabBarController {
            present(tabbarVC, animated: true)
        }
    }
    
    @IBAction func Done(_ sender: UIBarButtonItem) {
        if let myrowIndex = rowIndex{
            if myTextView.text == nil || myTextView.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
                return
            }
            else{
                levelArray[myrowIndex] = myTextView.text
                myTextView.resignFirstResponder()
            }
        }
    }
    
    @IBAction func Delete(_ sender: UIBarButtonItem) {
        
        if let myrowIndex = rowIndex{
            levelArray.remove(at: myrowIndex)
            myTableView.reloadData()
            rowIndex = nil
            myTextView.text = ""
        }
    }
}
