//
//  EmployeeTableViewCell.swift
//  PlistDemo
//
//  Created by Tushar Waghmare on 09/05/18.
//  Copyright © 2018 GiantLeapSystems. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

  @IBOutlet weak var employeeNameLabel: UILabel!
  @IBOutlet weak var employeeNoLabel: UILabel!
  @IBOutlet weak var favouriteBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
