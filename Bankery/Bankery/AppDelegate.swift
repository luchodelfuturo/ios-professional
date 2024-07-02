//
//  AppDelegate.swift
//  Bankery
//
//  Created by Luciano Federico Castro on 13/07/2022.
//

import UIKit

let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var hasOnboarded = false
    var window: UIWindow?
    let loginViewController = LoginViewController()
    let onBoardingContainer = OnboardingContainerViewController()
    let dummyViewController = DummyViewController()
    let mainViewController = MainViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[
        UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.makeKeyAndVisible()
            window?.backgroundColor = .systemBackground
            
            loginViewController.delegate = self
            onBoardingContainer.delegate = self
            dummyViewController.logoutDelegate = self
            
//            window?.rootViewController = mainViewController
//            window?.rootViewController = OnboardingContainerViewController()
            window?.rootViewController = AccountSummaryViewController()
//            window?.rootViewController = OnboardingViewController(heroImageName: "Pixel-Dinosaur", titleText: "Bankey is an app dadada, go to the store and download it")
            mainViewController.selectedIndex = 1 // Programaticamente seleccion con cual empezar
            
            return true
        }

   


}

extension AppDelegate:LoginViewControllerDelegate{
    func didLogin() {
        if LocalState.hasOnboarded {
            setRootViewController(dummyViewController)
        }
        else{
            setRootViewController(onBoardingContainer)
        }
        
    }
    
    
}
//el delegate q cambia de pantalla
extension AppDelegate:OnboardingContainerViewControllerDelegate{
    func didFinishOnBoarding() {
        LocalState.hasOnboarded = true
        setRootViewController(dummyViewController)
    }
    
    
}

extension AppDelegate: LogoutDelegate{
    func didLogout() {
        setRootViewController(loginViewController)
    }
}

//Animación para pasar de pantalla
extension AppDelegate{
    func setRootViewController(_ vc: UIViewController, animated:Bool = true){
        guard animated, let window = self.window else{
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window
                          , duration: 0.7,options: .transitionFlipFromTop, animations: nil,completion: nil)
    }
}
