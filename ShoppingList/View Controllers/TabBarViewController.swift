//
//  TabBarViewController.swift
//  ShoppingList
//
//  Created by Mikael Zehnter Frisk on 01/11/2021.
//

import UIKit


class TabBarViewController: UITabBarController {

    var itemsManager = ItemsManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        try? itemsManager.addItem("Dill")
        try? itemsManager.addItem("Ägg")

        let listTabViewModel = ListTabViewModel(itemsManager)
        let itemTabViewModel = ItemTabViewModel(itemsManager)

        let listNavigationController = UINavigationController(rootViewController: ListTabPageViewController(viewModel: listTabViewModel))
        let itemNavigationController = UINavigationController(rootViewController: ItemTabViewController(viewModel: itemTabViewModel))

        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()

        itemNavigationController.navigationBar.standardAppearance = appearance
        listNavigationController.navigationBar.standardAppearance = appearance

        itemNavigationController.navigationBar.scrollEdgeAppearance = appearance
        listNavigationController.navigationBar.scrollEdgeAppearance = appearance
        listNavigationController.navigationBar.scrollEdgeAppearance = appearance

        viewControllers = [listNavigationController, itemNavigationController]
    }
}
