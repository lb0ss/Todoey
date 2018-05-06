//
//  AppDelegate.swift
//  Todoey
//
//  Created by 林博斯 on 2/11/18.
//  Copyright © 2018 Bosi (Terrence) Lin. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        /// print (Realm.Configuration.defaultConfiguration.fileURL)

        
        do {
            _ = try Realm()
        } catch {
            print("Error initializing new Realm, \(error)")
        }
        return true
    }
}

