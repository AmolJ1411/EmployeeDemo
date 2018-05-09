//
//  DataModel.swift
//  AnshDemo
//
//  Created by kunal chavan on 09/05/18.
//  Copyright © 2018 kunal chavan. All rights reserved.
//

import Foundation

class DataModel {
    
    fileprivate var documentDirUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    var arrEmployees: [Employee] = []
    
    fileprivate func dataFilePath ()-> URL{
        return self.documentDirUrl.appendingPathComponent("employeePlist").appendingPathExtension("plist")
    }
    
    func addEmployee(employee: Employee) {
        arrEmployees.append(employee)
        saveEmployees()
    }
    
    
    func saveEmployees() {
        let employeesDict = arrEmployees.map { $0.dictionaryFormat } as NSArray
        employeesDict.write(to: dataFilePath(), atomically: true)
    }
    
    
    //read data
    func getEmployeeList() -> [Employee] {
        guard let employeePlist = NSArray(contentsOf: dataFilePath()) as? [[String: AnyObject]] else {
            return []
        }
        self.arrEmployees = employeePlist.map(Employee.init(dict:))
        return arrEmployees
    }
    
}
