//
//  ViewController.swift
//  5th_hw_KimMinjun
//
//  Created by 김민준 on 4/15/24.
//

import UIKit

class ViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        tabBar.tintColor = .white
        setTabBar()
    }
    // 탭바 높이 조절
    let HEIGHT_TAB_BAR:CGFloat = 110
    override func viewDidLayoutSubviews() {
                super.viewDidLayoutSubviews()
                var tabFrame = self.tabBar.frame
                tabFrame.size.height = HEIGHT_TAB_BAR
                tabFrame.origin.y = self.view.frame.size.height - HEIGHT_TAB_BAR
                self.tabBar.frame = tabFrame
            
            }
    
        //탭바 함수
    func setTabBar() {
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        let vc3 = UINavigationController(rootViewController: ThirdViewController())
        let vc4 = UINavigationController(rootViewController: ForthViewController())
        let vc5 = UINavigationController(rootViewController: FifthViewController())

        self.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        self.tabBar.backgroundColor = #colorLiteral(red: 0.07140306383, green: 0.07140306383, blue: 0.07140306383, alpha: 1)
        self.tabBar.barTintColor = .black
        
        vc1.tabBarItem.image = UIImage(named: "house")
        vc2.tabBarItem.image = UIImage(named: "search")
        vc3.tabBarItem.image = UIImage(named: "commingsoon")
        vc4.tabBarItem.image = UIImage(named: "download")
        vc5.tabBarItem.image = UIImage(named: "more")
      
        vc1.title = "Home"
        vc2.title = "Search"
        vc3.title = "Comming Soon"
        vc4.title = "Downloads"
        vc5.title = "More"
        
    }
    
    
    
}

