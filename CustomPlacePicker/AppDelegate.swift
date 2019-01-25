//
//  AppDelegate.swift
//  CustomPlacePicker
//
//  Created by lamha on 1/21/19.
//  Copyright © 2019 lamha. All rights reserved.
//

import UIKit
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GMSPlacesClient.provideAPIKey("YOUR_API_KEY")
        return true
    }
}

