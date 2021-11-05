//
//  PickItemViewController.swift
//  ShoppingList
//
//  Created by Mikael Zehnter Frisk on 05/11/2021.
//

import UIKit

final class PickItemViewController: UIViewController {

    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)

        navigationItem.title = "Add Items"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(didTapCancelButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDoneButton))

        navigationController?.navigationBar.prefersLargeTitles = true

        view.backgroundColor = .systemBackground
    }

    @objc
    private func didTapCancelButton() {
        dismiss(animated: true)
    }

    @objc
    private func didTapDoneButton() {

    }

}
