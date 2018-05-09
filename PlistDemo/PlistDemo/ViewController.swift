//
//  ViewController.swift
//  PlistDemo
//
//  Created by Tushar Waghmare on 09/05/18.
//  Copyright © 2018 GiantLeapSystems. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var empolyeeTable: UITableView!
    
    let datamodel = DataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        datamodel.loadData()
        empolyeeTable.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datamodel.saveTrack.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = empolyeeTable.dequeueReusableCell(withIdentifier: "employeeCell") as! EmployeeTableViewCell
        let empData = datamodel.saveTrack[indexPath.row]
        cell.employeeNameLabel.text = empData.name
        cell.employeeNoLabel.text = empData.location
        return cell
    }
}

