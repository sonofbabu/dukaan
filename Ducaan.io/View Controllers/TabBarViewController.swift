//
//  TabBarViewController.swift
//  Ducaan.io
//
//  Created by leyo babu on 25/01/21.
//  Copyright © 2021 leyo babu. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    var tabBarItemData = UITabBarItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initMethod()
    }
    
        
// MARK:- INIT-METHOD
    func initMethod(){
        self.addingTabBarAppearence()
    }
    
// MARK:- ADDED TAB-BAR APPEARENCE
    func addingTabBarAppearence(){
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor(hexFromString: "#146AAE")], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.darkGray], for: .normal)
        self.addingTabBarImages()
    }
    
// MARK:- ADDED TAB-BAR IMAGES
    func addingTabBarImages(){
        let selectedTabImage1 = UIImage(named: "D_Home_Blue")?.withRenderingMode(.alwaysOriginal)
        let deSelectedTabImage1 = UIImage(named: "D_Home_Gray")?.withRenderingMode(.alwaysOriginal)
        tabBarItemData = self.tabBar.items?[0] ?? UITabBarItem()
        tabBarItemData.image = deSelectedTabImage1
        tabBarItemData.selectedImage = selectedTabImage1
        
        
        let selectedTabImage2 = UIImage(named: "D_Bag_Blue")?.withRenderingMode(.alwaysOriginal)
        let deSelectedTabImage2 = UIImage(named: "D_Bag_Gray")?.withRenderingMode(.alwaysOriginal)
        tabBarItemData = self.tabBar.items?[1] ?? UITabBarItem()
        tabBarItemData.image = deSelectedTabImage2
        tabBarItemData.selectedImage = selectedTabImage2
        tabBarItemData.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0) // added this are image pixels are more
        
        let selectedTabImage3 = UIImage(named: "D_Order_Blue")?.withRenderingMode(.alwaysOriginal)
        let deSelectedTabImage3 = UIImage(named: "D_Order_Gray")?.withRenderingMode(.alwaysOriginal)
        tabBarItemData = self.tabBar.items?[2] ?? UITabBarItem()
        tabBarItemData.image = deSelectedTabImage3
        tabBarItemData.selectedImage = selectedTabImage3
        tabBarItemData.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0) // added this are image pixels are more
        
//        let numberOFTabs = CGFloat((tabBar.items?.count)!)
//        let tabBarSize = CGSize(width: tabBar.frame.width, height: tabBar.frame.height)
        
        self.selectedIndex = 0 // MARK: SETTING INITIAL INDEX TO 0
        
    }

}

// MARK:- UICOLOR EXTENSION
extension UIColor {
    convenience init(hexFromString:String, alpha:CGFloat = 1.0) {
        var cString:String = hexFromString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgbValue:UInt32 = 10066329 //color #999999 if string has wrong format

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) == 6) {
            Scanner(string: cString).scanHexInt32(&rgbValue)
        }

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
