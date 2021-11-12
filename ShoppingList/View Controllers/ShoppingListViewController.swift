//
//  ListViewController.swift
//  ShoppingList
//
//  Created by Mikael Zehnter Frisk on 01/11/2021.
//

import UIKit

class ShoppingListViewController: UIViewController {

    let listContainerView = UIView(frame: .zero)
    let scrollView = UIScrollView()
    let listStackView = UIStackView(frame: .zero)
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

        viewModel.delegate = self

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
        listStackView.translatesAutoresizingMaskIntoConstraints = false
        listStackView.axis = .vertical
        listStackView.distribution = .equalSpacing
        listStackView.alignment = .leading

        setupScrollView()
        addItemsToCard()
        addNewItemButton()
    }

    func setupScrollView() {
        listContainerView.addSubview(scrollView)
        scrollView.addSubview(listStackView)

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: listContainerView.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: listContainerView.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: listContainerView.rightAnchor),
            listStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            listStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            listStackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            listStackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor)
        ])


        NSLayoutConstraint.activate([
        ])
    }

    private func addItemsToCard() {
        for item in viewModel.items {
            let itemStackView = UIStackView(frame: .zero)
            itemStackView.axis = .horizontal
            itemStackView.alignment = .leading
            itemStackView.distribution = .equalCentering

            let label = UILabel()
            label.text = item.name

            var configuration = UIButton.Configuration.borderless()
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
            scrollView.bottomAnchor.constraint(equalTo: newItemButton.topAnchor),
            newItemButton.bottomAnchor.constraint(equalTo: listContainerView.bottomAnchor),
            newItemButton.leftAnchor.constraint(equalTo: listContainerView.leftAnchor, constant: leftButtonAnchor),
            newItemButton.rightAnchor.constraint(equalTo: listContainerView.rightAnchor, constant: rightButtonAnchor)
        ])
    }

@objc
    private func didTapDoneButton(sender: UIButton) {
        let index = sender.tag
        viewModel.toggleDone(for: viewModel.items[index])
    }

    @objc
    private func didTapAddNewItem() {

        let addItemsNavigationController = UINavigationController(rootViewController: PickItemViewController(viewModel: viewModel.createPickItemViewModel(), delegate:self))

        present(addItemsNavigationController, animated: true)
    }
}

extension ShoppingListViewController: ListViewModelDelegate {
    func viewModelDidUpdateList(_ viewModel: ListViewModel) {
        for view in listStackView.arrangedSubviews {
            listStackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }

        addItemsToCard()
    }

    func didAddItems(_ items: [Item]) {
        for item in items {
            viewModel.addItem(item)
        }
    }
}
