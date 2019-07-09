//
//  StudentTableViewCell.swift
//  Day7TabViewAndPlistExample
//
//  Created by moxDroid on 2019-07-08.
//  Copyright © 2019 moxDroid. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblStudentName: UILabel!
    @IBOutlet weak var lblStudentId: UILabel!
    @IBOutlet weak var imgStudent: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
