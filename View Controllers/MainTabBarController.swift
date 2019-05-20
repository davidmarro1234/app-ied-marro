//
//  MainTabBarController.swift
//  David Marro
//
//  Created by IED Student on 20/05/2019.
//  Copyright © 2019 David Marro. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tabBarItems = tabBar.items {
            
            let dimensioneIcone = CGSize(width: 30.0, height: 30.0)
            
            // HOME
            
            
            if tabBarItems.count >= 1{
                let itemHome = tabBarItemsAjustment[0]
                
                // Cambio il titolo
                itemHome.title = "Home"
                
                // Cambio l'icona
                itemHome.image = UIImage.init(named: "calendar")
                itemHome.image = image
                itemHome.image = UIUtility.resizeImage(image, targetSize: dimensioneIcone)
            }
            
            // HOME
            
            if tabBarItems.count >= 2{
            
                let itemMappa = tabBarItemsAjustment[1]
                
                // Cambio il titolo
                itemHome.title = "Mappa"
                
                // Cambio l'icona
                itemMappa.image = UIImage.init(named: "map")
                itemMappa.image = image
                itemMappa.image = UIUtility.resizeImage(image, targetSize: dimensioneIcone)

            }
            
            
        }
        
        
    }
    
}
