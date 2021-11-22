//
//  AddItemViewController.swift
//  ShoppingList
//
//  Created by Mikael Zehnter Frisk on 22/11/2021.
//

import UIKit

class AddItemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        setupNavigationBar()
    }

    private func setupNavigationBar() {
        navigationItem.title = "Add Item"
        navigationController?.navigationBar.prefersLargeTitles = true

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didTapCancelButton))
    }

    @objc
    private func didTapCancelButton() {
        dismiss(animated: true, completion: nil)
    }
    
}
