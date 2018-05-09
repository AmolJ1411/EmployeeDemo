//
//  NewEmployeeViewController.swift
//  PlistDemo
//
//  Created by Tushar Waghmare on 09/05/18.
//  Copyright © 2018 GiantLeapSystems. All rights reserved.
//

import UIKit

//class SavedTracks: NSObject,NSCoding {
//    var name: String
//    var location: String
//    
//    required init(name:String="", location:String="") {
//        self.name = name
//        self.location = location
//    }
//    
//    required init(coder decoder: NSCoder) {
//        self.name = decoder.decodeObject(forKey: "Name") as? String ?? ""
//        self.location = decoder.decodeObject(forKey: "location") as? String ?? ""
//    }
//    
//    func encode(with coder: NSCoder) {
//        coder.encode(name, forKey:"Name")
//        coder.encode(location, forKey:"location")
//    }
//    
//}
//
//
//class DataModel: NSObject {
//    
//    var saveTrack = [SavedTracks]()
//    
//    override init(){
//        super.init()
//        print("document file path：\(documentsDirectory())")
//        print("Data file path：\(dataFilePath())")
//    }
//    
//    //save data
//    func saveData() {
//        let data = NSMutableData()
//        let archiver = NSKeyedArchiver(forWritingWith: data)
//        archiver.encode(saveTrack, forKey: "userList")
//        archiver.finishEncoding()
//        data.write(toFile: dataFilePath(), atomically: true)
//    }
//    
//    //read data
//    func loadData() {
//        let path = self.dataFilePath()
//        let defaultManager = FileManager()
//        if defaultManager.fileExists(atPath: path) {
//            let url = URL(fileURLWithPath: path)
//            let data = try! Data(contentsOf: url)
//            let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
//            saveTrack = unarchiver.decodeObject(forKey: "userList") as! Array
//            unarchiver.finishDecoding()
//        }
//    }
//    
//    func documentsDirectory()->String {
//        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory,
//                                                        .userDomainMask, true)
//        let documentsDirectory = paths.first!
//        return documentsDirectory
//    }
//    
//    func dataFilePath ()->String{
//        return self.documentsDirectory().appendingFormat("/userList.plist")
//    }
//}


class NewEmployeeViewController: UIViewController {
    
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var numberTextfield: UITextField!
    
    let dataModel = DataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func addEmployeeToPlist(_ sender: UIButton) {
        dataModel.saveTrack.append(SavedTracks(name: nameTextfield.text!, location: numberTextfield.text!))
        dataModel.saveData()
        
        print("name:\(dataModel.saveTrack.count)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
