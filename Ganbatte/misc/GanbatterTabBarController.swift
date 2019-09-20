//
//  GanbatterTabBarController.swift
//  Ganbatte
//
//  Created by Student on 18/09/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class GanbatterTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.title == "History" {
            if let historyNavigation = viewControllers?[2] as? UINavigationController {
                if let historyTableView = historyNavigation.viewControllers[0] as? HistoryTableViewController {
                    historyTableView.updateActivities()
                }
            }
        }
        if item.title == "Statistics" {
            if let statistics = viewControllers?[1] as? StatisticsViewController {
                statistics.updateActivities()
            }
        }
    }

}
