//
//  ThirdViewController.swift
//  Day7TabViewAndPlistExample
//
//  Created by moxDroid on 2019-07-08.
//  Copyright © 2019 moxDroid. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        readStudentInfoPlistFile()
    }
    
    func readStudentInfoPlistFile()
    {
        if let plist = Bundle.main.path(forResource: "StudentInfo", ofType: "plist")
        {
            //print(plist)
        
            //let dict = NSMutableDictionary(contentsOfFile: plist!)
            if let dict = NSDictionary(contentsOfFile: plist)
            {
                //Reading the colors
                if let colors = dict["colors"] as? [String]
                {
                    print(colors)
                    for color in colors
                    {
                        print(color)
                    }
                    
                }
                //print(dict["students"])
                //Read Student Arrays
                if let students = dict["students"] as? [[String:Any]]
                {
                    for student in students
                    {
                        print(student["studentID"] as! Int)
                        print(student["studentName"] as! String)
                        print(student["city"] as! String)
                    }
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
