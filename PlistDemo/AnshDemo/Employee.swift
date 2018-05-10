//
//  Employee.swift
//  AnshDemo
//
//  Created by kunal chavan on 09/05/18.
//  Copyright © 2018 kunal chavan. All rights reserved.
//

import Foundation

struct Employee {
    
    var name: String
    var mobileNumber: String
    var isFavourite: Bool
    
    init(name: String, mobileNumber: String, fav: Bool) {
        self.name = name
        self.mobileNumber = mobileNumber
        self.isFavourite = fav
    }
    
    init(dict: [String: AnyObject]) {
        name = dict["name"] as! String
        mobileNumber = dict["mobileNumber"] as! String
        isFavourite = dict["isFavourite"] as! Bool
    }
}

extension Employee{
    
    var dictionaryFormat: [String : AnyObject] {
        var dict: [String : AnyObject] = [:]
        dict["name"] = name as AnyObject
        dict["mobileNumber"] = mobileNumber as AnyObject
        dict["isFavourite"] = isFavourite as AnyObject
        return dict
    }
    
    
}
