//
//  ListViewController.swift
//  ShoppingList
//
//  Created by Mikael Zehnter Frisk on 01/11/2021.
//

import UIKit

class ShoppingListViewController: UIViewController {

    let containerView = UIView(frame: .zero)
    let stackView = UIStackView(frame: .zero)
    let viewModel: ListViewModel

    init(viewModel: ListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(containerView)

        containerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])

        styleContainer()
        setupStackView()
    }

    private func styleContainer() {
        containerView.layer.cornerRadius = 8
        containerView.layer.borderColor = UIColor.gray.cgColor
        containerView.layer.borderWidth = 1
    }

    private func setupStackView() {
        containerView.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: containerView.rightAnchor)
        ])

        addItemsToCard()

        let newItemButton = UIButton()
        newItemButton.setImage(UIImage(systemName: "add"), for: .normal)
        newItemButton.setTitle("Add Item", for: .normal)
        stackView.addArrangedSubview(newItemButton)
    }

    private func addItemsToCard() {
        for item in viewModel.items {
            let itemStackView = UIStackView(frame: .zero)
            itemStackView.axis = .horizontal
            itemStackView.alignment = .leading
            itemStackView.distribution = .equalCentering

            let label = UILabel()
            label.text = item.name

            var configuration = UIButton.Configuration.filled()
            let icon = item.done ? UIImage(systemName: "circle.fill") : UIImage(systemName: "circle")
            configuration.image = icon

            let button = UIButton(configuration: configuration, primaryAction: nil)
            button.layer.cornerRadius = button.frame.height / 2

            itemStackView.addArrangedSubview(button)
            itemStackView.addArrangedSubview(label)
            stackView.addArrangedSubview(itemStackView)
        }
    }

}
