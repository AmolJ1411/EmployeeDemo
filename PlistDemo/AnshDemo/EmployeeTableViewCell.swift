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
    
    @IBOutlet weak var btnButton: UIButton!
    
    var employee: Employee? {
        
        didSet{
            lblName.text = employee?.name
            lblMob.text = employee?.mobileNumber
            setTitle()
        }
    }
    
    weak var delegate: EmployeeTableViewCellDelegate?
    
    
    @IBAction func actionFav(_ sender: Any) {
        employee!.isFavourite = !employee!.isFavourite
        setTitle()
        delegate?.didSelectfav(employee: employee)
    }
    
    func setTitle() {
        guard employee != nil else {
            return
        }

        if employee!.isFavourite {
            btnButton.setTitle("Favorite", for: .normal)
        }else {
            btnButton.setTitle("Mark favorite", for: .normal)
        }
    }
    
}
