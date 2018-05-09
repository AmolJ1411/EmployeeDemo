//
//  EmployeeTableViewCell.swift
//  AnshDemo
//
//  Created by kunal chavan on 09/05/18.
//  Copyright © 2018 kunal chavan. All rights reserved.
//

import UIKit
protocol EmployeeTableViewCellDelegate: class {
    func didSelectfav(employee: Employee?)
}

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblMob: UILabel!
    
    
    var employee: Employee? {
        
        didSet{
            lblName.text = employee?.name
            lblMob.text = employee?.mobileNumber
        }
    }
    
    weak var delegate: EmployeeTableViewCellDelegate?
    
    
    @IBAction func actionFav(_ sender: Any) {
        delegate?.didSelectfav(employee: employee)
    }
    
}
