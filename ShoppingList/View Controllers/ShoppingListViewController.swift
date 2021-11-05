//
//  ListViewController.swift
//  ShoppingList
//
//  Created by Mikael Zehnter Frisk on 01/11/2021.
//

import UIKit

class ShoppingListViewController: UIViewController {

    let listContainerView = UIView(frame: .zero)
    let listStackView = UIStackView(frame: .zero)
    let itemStackView = UIStackView(frame: .zero)
    var viewModel: ListViewModel

    init(viewModel: ListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(listContainerView)

        listContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            listContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            listContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            listContainerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            listContainerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])

        styleContainer()
        setupStackView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    private func styleContainer() {
        listContainerView.layer.cornerRadius = 8
        listContainerView.layer.borderColor = UIColor.gray.cgColor
        listContainerView.layer.borderWidth = 1
    }

    private func setupStackView() {
        listContainerView.translatesAutoresizingMaskIntoConstraints = false
        listContainerView.addSubview(listStackView)

        listStackView.translatesAutoresizingMaskIntoConstraints = false
        listStackView.axis = .vertical
        listStackView.distribution = .equalSpacing
        listStackView.alignment = .leading

        NSLayoutConstraint.activate([
            listStackView.topAnchor.constraint(equalTo: listContainerView.topAnchor),
            listStackView.leftAnchor.constraint(equalTo: listContainerView.leftAnchor),
            listStackView.rightAnchor.constraint(equalTo: listContainerView.rightAnchor)
        ])

        addItemsToCard()
        addNewItemButton()
    }

    private func addNewItemButton() {
        var configuration = UIButton.Configuration.bordered()
        configuration.image = UIImage(systemName: "plus")
        configuration.title = "Add Item"

        let newItemButton = UIButton(configuration: configuration, primaryAction: nil)
        listContainerView.addSubview(newItemButton)

        newItemButton.addTarget(self, action: #selector(didTapAddNewItem), for: .touchUpInside)
        newItemButton.translatesAutoresizingMaskIntoConstraints = false
        let containerWidth = listContainerView.layer.bounds.width
        let halfButtonWidth = containerWidth / 12
        let leftButtonAnchor = (containerWidth / 2) - halfButtonWidth
        let rightButtonAnchor = (containerWidth / 2) + halfButtonWidth

        print(containerWidth)
        NSLayoutConstraint.activate([
            newItemButton.bottomAnchor.constraint(equalTo: listContainerView.bottomAnchor),
            newItemButton.leftAnchor.constraint(equalTo: listContainerView.leftAnchor, constant: leftButtonAnchor),
            newItemButton.rightAnchor.constraint(equalTo: listContainerView.rightAnchor, constant: rightButtonAnchor)
        ])

    }

    private func addItemsToCard() {
        for item in viewModel.items {
            itemStackView.axis = .horizontal
            itemStackView.alignment = .leading
            itemStackView.distribution = .equalCentering

            let label = UILabel()
            label.text = item.name

            var configuration = UIButton.Configuration.bordered()
            let icon = item.done ? UIImage(systemName: "circle.fill") : UIImage(systemName: "circle")
            configuration.image = icon

            let button = UIButton(configuration: configuration, primaryAction: nil)
            button.addTarget(self, action: #selector(didTapDoneButton), for: .touchUpInside)
            button.layer.cornerRadius = button.frame.height / 2
            button.tag = viewModel.items.firstIndex(of: item)!

            itemStackView.addArrangedSubview(button)
            itemStackView.addArrangedSubview(label)
            listStackView.addArrangedSubview(itemStackView)
        }
    }

    @objc
    private func didTapDoneButton(sender: UIButton) {
        let index = sender.tag
        viewModel.items[index].done = !viewModel.items[index].done
        print(viewModel.items)
    }

    @objc
    private func didTapAddNewItem() {
        viewModel.items.append(Item(name: "New Item", done: false))
        print(viewModel.items)
    }
}
