//
//  AddNewItemViewController.swift
//  ShoppingList
//
//  Created by Mikael Zehnter Frisk on 12/11/2021.
//

import UIKit

final class ItemDetailsViewController: UIViewController {

    let stackView = UIStackView()
    let itemName: String

    init(_ itemName: String) {
        self.itemName = itemName
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(stackView)
        setupNavigationItem()
        setupStackView()
    }

    private func setupStackView() {
        let descriptionLabel = UILabel(frame: .zero)
        let itemNameLabel = UILabel(frame: .zero)
        descriptionLabel.text = "Name of item"
        itemNameLabel.text = itemName
        itemNameLabel.font = UIFont.boldSystemFont(ofSize: 20)

        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(itemNameLabel)
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing

        stackView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: stackView.topAnchor),
            itemNameLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10)
        ])
    }

    private func setupNavigationItem() {
        navigationItem.title = "Item Details"
    }

}
