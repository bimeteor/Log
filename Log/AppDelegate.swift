//
//  AppDelegate.swift
//  Log
//
//  Created by WG on 2016/12/12.
//  Copyright © 2016年 WG. All rights reserved.
//

import UIKit


 func swap(a:inout Int, b:inout Int){
 let c=a
 a=b
 b=c
 }

func swap1(a:UnsafeMutablePointer<Int>, b:UnsafeMutablePointer<Int>){
    let c=a.pointee
    //a.pointee=b.pointee
    //b.pointee=c
    print(a)
    a.withMemoryRebound(to: Int8.self, capacity: 1, {ptr in ptr.pointee=2
    print(a)
    })
}

class Person: NSObject {
    override init() {
        name="as";
        super.init()
    }
    public var name:String
    
    public class func sleep(){print("sleep")}
    public func wake(){print("wake \(name)")}
//    public func fun()->(Int)->Int{
////        var add:(Int)->Int={$0}
//        return add
//    }
}

struct CallbackUserData {
    func sayHello() { print("Hello world!" ) }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window=UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let ctr=ViewController()
        window?.rootViewController=ctr
        _ = LogManager.shared
        logInfo("aa")
        logEvent("bb")
        return true
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
    }


}

