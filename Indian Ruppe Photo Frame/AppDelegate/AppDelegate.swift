//
//  AppDelegate.swift
//  Indian Ruppe Photo Frame
//
//  Created by Alpesh on 01/12/16.
//  Copyright © 2016 Cousins Infotech. All rights reserved.
//

import UIKit
import CoreData
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

   var window: UIWindow?
    var navController: UINavigationController?
    var shouldSupportAllOrientation = false
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
         GADMobileAds.configure(withApplicationID: "ca-app-pub-3940256099942544~1458002511")
        
        navController = UINavigationController()
        let viewController: HomeViewController = HomeViewController()
        
        self.navController!.pushViewController(viewController, animated: false)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window!.rootViewController = navController
        
        self.window!.backgroundColor = UIColor.white
        
        self.window!.makeKeyAndVisible()
        
        
        
        // Override point for customization after application launch.
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        
        if (shouldSupportAllOrientation == true){
            return UIInterfaceOrientationMask.landscape
        }
        return UIInterfaceOrientationMask.portrait
    }
   
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
    }
    
//    func checkOrientation(viewController:UIViewController?)-> Int{
//        
//        if(viewController == nil){
//            
//            return Int(UIInterfaceOrientationMask.all.rawValue)//All means all orientation
//            
//        }else if (viewController is RupeeViewController){
//            
//            return Int(UIInterfaceOrientationMask.landscape.rawValue)//This is sign in view controller that i only want to set this to portrait mode only
//            
//        }else{
//            
//            return checkOrientation(viewController: viewController!.presentedViewController)
//        }
//    }
//    
    
}



