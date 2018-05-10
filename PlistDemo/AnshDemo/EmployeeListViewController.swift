//
//  ViewController.swift
//  AnshDemo
//
//  Created by kunal chavan on 09/05/18.
//  Copyright © 2018 kunal chavan. All rights reserved.
//

import UIKit

class EmployeeListViewController: UIViewController {
    
    @IBOutlet weak var tblEmplyoee: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    let cellId = "EmployeeTableViewCell"
    
    var arrEmployee: [Employee] = []
    
    var dataModel = DataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        arrEmployee = dataModel.getEmployeeList()
        tblEmplyoee.reloadData()
    }
    
    @IBAction func addEmployee(sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "EmployeeDetailsViewController") as! EmployeeDetailsViewController
        vc.datModel = self.dataModel
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func segmentChanged(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            arrEmployee = dataModel.getEmployeeList()
        }else {
            filterDataSource()
        }
        tblEmplyoee.reloadData()
    }
    
    func filterDataSource() {
       arrEmployee = arrEmployee.filter { (employee) -> Bool in
            return employee.isFavourite
        }
    }

}

extension EmployeeListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrEmployee.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! EmployeeTableViewCell
        cell.delegate = self
        cell.employee = arrEmployee[indexPath.row]
        return cell
    }
}

extension EmployeeListViewController: UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "EmployeeDetailsViewController") as! EmployeeDetailsViewController
        vc.employee = arrEmployee[indexPath.row]
        vc.selectedEmployeeIndex = indexPath.row
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension EmployeeListViewController: EmployeeTableViewCellDelegate {
    func didSelectfav(employee: Employee?) {
        
    }
}

extension EmployeeListViewController: EmployeeDetailsViewControllerDelegate {
    func updateEmployee(employee: Employee, with index: Int) {
        dataModel.arrEmployees[index] = employee
        dataModel.saveEmployees()
        arrEmployee = dataModel.arrEmployees
        tblEmplyoee.reloadData()
    }

}
