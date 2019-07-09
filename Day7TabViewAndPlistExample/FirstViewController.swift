//
//  FirstViewController.swift
//  Day7TabViewAndPlistExample
//
//  Created by moxDroid on 2019-07-08.
//  Copyright © 2019 moxDroid. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblColors: UITableView!
    var colorsArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblColors.delegate = self
        self.tblColors.dataSource = self
        
        readColorsFromPlistFile()
    }
    
    func readColorsFromPlistFile()
    {
        if let plist = Bundle.main.path(forResource: "StudentInfo", ofType: "plist")
        {
            if let dict = NSDictionary(contentsOfFile: plist)
            {
                //Reading the colors
                if let colors = dict["colors"] as? [String]
                {
                    self.colorsArray += colors
                    self.tblColors.reloadData()
                }
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellColors")
        cell?.textLabel?.text = self.colorsArray[indexPath.row]
    
        return cell!
    }

}

