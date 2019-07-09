//
//  SecondViewController.swift
//  Day7TabViewAndPlistExample
//
//  Created by moxDroid on 2019-07-08.
//  Copyright © 2019 moxDroid. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    @IBOutlet weak var tblStudent: UITableView!
    
    var students = [Student]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblStudent.delegate = self
        self.tblStudent.dataSource = self
        
        readStudentInfoPlistFile()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellStudent") as! StudentTableViewCell
        let stud = self.students[indexPath.row]
      
        cell.lblStudentId.text = "Student ID : \(stud.studentId)"
        cell.lblStudentName.text = "Name : \(stud.studentName)"
        cell.lblCity.text = "City : \(stud.city)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    
    func readStudentInfoPlistFile()
    {
        if let plist = Bundle.main.path(forResource: "StudentInfo", ofType: "plist")
        {
            if let dict = NSDictionary(contentsOfFile: plist)
            {
                if let students = dict["students"] as? [[String:Any]]
                {
                    for student in students
                    {
                        let studentId = student["studentID"] as! Int
                        let studentName = student["studentName"] as! String
                        let city = student["city"] as! String
                        
                        self.students.append(Student(studentId: studentId, studentName: studentName, city: city))
                        
                        self.tblStudent.reloadData()
                    }
                }
            }
        }
    }

}

