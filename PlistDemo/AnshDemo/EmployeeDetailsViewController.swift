//
//  EmployeeDetailsViewController.swift
//  AnshDemo
//
//  Created by kunal chavan on 09/05/18.
//  Copyright © 2018 kunal chavan. All rights reserved.
//

import UIKit

protocol EmployeeDetailsViewControllerDelegate: class {
    func updateEmployee(employee: Employee, with index: Int)
}

class EmployeeDetailsViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfMobile: UITextField!
    
    @IBOutlet weak var btnAdd: UIButton!
    
    var datModel: DataModel?
    
    var employee: Employee?
    var selectedEmployeeIndex: Int?
    
    weak var delegate: EmployeeDetailsViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpFieldsByEmployee()
        
    }
    
    func setUpFieldsByEmployee() {
        
        if employee != nil {
            
            tfName.text = employee?.name
            tfMobile.text = employee?.mobileNumber
            
            btnAdd.setTitle("Update", for: .normal)
        }
    }
    
    
    
    @IBAction func actionAdd(_ sender: Any) {
        
        if employee != nil, selectedEmployeeIndex != nil {
            
            employee?.name = tfName.text!
            employee?.mobileNumber = tfMobile.text!
            
            delegate?.updateEmployee(employee: employee!, with: selectedEmployeeIndex!)
            navigationController?.popViewController(animated: true)
            
        }else{
            
            datModel?.addEmployee(employee: Employee(name: tfName.text!, mobileNumber: tfMobile.text!, fav: false))
            navigationController?.popViewController(animated: true)
        }
    }
}
