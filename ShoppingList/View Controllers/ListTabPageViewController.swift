//
//  ViewController2.swift
//  ShoppingList
//
//  Created by Mikael Zehnter Frisk on 01/11/2021.
//

import Foundation
import UIKit

class ListTabPageViewController: UIPageViewController {

    let listTabViewModel: ListTabViewModel
    var listViewControllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        setupNavigation()
        listViewControllers.append(ShoppingListViewController(viewModel: listTabViewModel.createListViewModel()))

        setViewControllers(listViewControllers, direction: .forward, animated: false)
    }

    func setupNavigation() {
        navigationItem.title = "Lists"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tappedNewList))
    }

    init (viewModel: ListTabViewModel) {
        listTabViewModel = viewModel
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        setupTabBarItem()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupTabBarItem() {
        tabBarItem.title = "Lists"
        tabBarItem.image = UIImage(systemName: "star.fill")
        view.backgroundColor = .systemBackground
    }

    @objc
    func tappedNewList() {
        listViewControllers.append(ShoppingListViewController(viewModel: listTabViewModel.createListViewModel()))
    }
}

extension ListTabPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let firstIndex = listViewControllers.firstIndex(of: viewController) else {
            return nil
        }

        if firstIndex == 0 {
            return nil
        }
        else {
            return listViewControllers[firstIndex - 1]
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let firstIndex = listViewControllers.firstIndex(of: viewController) else {
            return nil
        }

        if firstIndex + 1 == listViewControllers.endIndex {
            return nil
        }
        else {
            return listViewControllers[firstIndex + 1]
        }
    }
}

extension ListTabPageViewController: UIPageViewControllerDelegate {

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return listViewControllers.count
    }
}
