//
//  TabBarViewController.swift
//  ShoppingList
//
//  Created by Mikael Zehnter Frisk on 01/11/2021.
//

import UIKit


class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let listNavigationController = UINavigationController(rootViewController: ListTabViewController())
        let itemNavigationController = UINavigationController(rootViewController: ItemTabViewController())

        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()

        itemNavigationController.navigationBar.standardAppearance = appearance
        listNavigationController.navigationBar.standardAppearance = appearance

        itemNavigationController.navigationBar.scrollEdgeAppearance = appearance
        listNavigationController.navigationBar.scrollEdgeAppearance = appearance

        viewControllers = [listNavigationController, itemNavigationController]
    }
}
