//
//  AppDelegate.swift
//  AirliftCaseStudy
//
//  Created by IMac on 30/08/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - VARIABLES
    
    var window: UIWindow?
    let appDIContainer = AppDIContainer()
    var appCoordinator: AppCoordinator?
    
    
    // MARK: - APP LIFE CYCLE
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let naviagtion = AppNavigation()
        window?.rootViewController = naviagtion
        appCoordinator = AppCoordinator(navigation: naviagtion, appDIContainer: appDIContainer)
        appCoordinator?.start()
        return true
    }


}

