/*
This is a course requirement for CS 192 Software Engineering II
under the supervisino of Asst. Prof. Ma. Rowena C. Solamo
of the Department of computer Science, College of Engineering,
University of the Philippines, Diliman
for the AY 2017-2018

 This code is created by Joan Nicole Balugay and Brian Sy.

 
Code History
  Programmer           Date       Description
  Brian Sy             01/29/18   Creation
  Joan Nicole Balugay  01/29/18   Creation

File Creation Date: 01/29/18
Development Group: Joan Nicole Balugay, Brian Sy
Client Group: CS 192
Purpose of the Software: Note taking application - Turtl
*/

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{
     var window: UIWindow?

     /* Override point for customization after application launch. */
     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool{
        UIApplication.shared.statusBarStyle = .lightContent
        
        return true
     }

    /* Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state. */
    /* Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.*/
     func applicationWillResignActive(_ application: UIApplication){
    
     }

    /* Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
       If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.*/
     func applicationDidEnterBackground(_ application: UIApplication){
        
     }

     /* Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background. */
     func applicationWillEnterForeground(_ application: UIApplication){
        
     }

     /* Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface. */

     func applicationDidBecomeActive(_ application: UIApplication){
        
     }
    
     /* Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:. */
     func applicationWillTerminate(_ application: UIApplication){
        
     }
}

