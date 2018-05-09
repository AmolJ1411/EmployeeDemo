//
//  AppDelegate.swift
//  AnshDemo
//
//  Created by kunal chavan on 09/05/18.
//  Copyright © 2018 kunal chavan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        return true
    }
    

}


class StorageController {
    fileprivate let documentsDirectoryURL = FileManager.default
        .urls(for: .documentDirectory, in: .userDomainMask)
        .first!
    
    fileprivate var accountsFileURL: URL {
        return documentsDirectoryURL
            .appendingPathComponent("Accounts")
            .appendingPathExtension("plist")
    }
    
    func save(_ accounts: [Employee]) {
        let accountsPlist = accounts.map { $0.dictionaryFormat } as NSArray
        accountsPlist.write(to: accountsFileURL, atomically: true)
    }
    
//    func fetchAccounts() -> [Employee] {
//        guard let accountPlists = NSArray(contentsOf: accountsFileURL) as? [[String: AnyObject]] else {
//            return []
//        }
//        return []//accountPlists.map(Employee.init(plist:))
//    }
}

