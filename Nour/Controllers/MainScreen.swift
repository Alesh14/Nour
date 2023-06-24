//
//  MainScreen.swift
//  Nour
//
//  Created by Alisher Manatbek on 12.06.2023.
//

import UIKit

class MainScreen: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let VC1 = SurahScreen()
        VC1.title = "Quran"
        
        let nav1 = UINavigationController(rootViewController: VC1)
        nav1.navigationBar.prefersLargeTitles = false
        
        nav1.tabBarItem = UITabBarItem(title: "Quran", image: UIImage(systemName: "book.circle"), tag: 1)
        
        let VC2 = DhikrScreen()
        VC2.title = "Dhikr"
        
        let nav2 = UINavigationController(rootViewController: VC2)
        nav2.navigationBar.prefersLargeTitles = false
        
        nav2.tabBarItem = UITabBarItem(title: "Dhikr", image: UIImage(systemName: "33.circle"), tag: 1)
        
        let VC3 = SettingsScreen()
        VC3.title = "Settings"
        
        let nav3 = UINavigationController(rootViewController: VC3)
        nav3.navigationBar.prefersLargeTitles = false
        
        nav3.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape"), tag: 1)
        
        setViewControllers([nav1, nav2, nav3], animated: false)
    }
        
}
