//
//  ViewController1.swift
//  ShoppingList
//
//  Created by Mikael Zehnter Frisk on 01/11/2021.
//

import Foundation
import UIKit

class ItemTabViewController: UIViewController {

    let collectionView: UICollectionView
    let viewModel: ItemTabViewModel

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Items"
    }

    init(viewModel: ItemTabViewModel) {
        self.viewModel = viewModel
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        super.init(nibName: nil, bundle: nil)
        setupTabBarItem()
        setupNavigationBar()
        setupCollectionView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTabBarItem() {
        tabBarItem.title = "Items"
        tabBarItem.image = UIImage(systemName: "heart.fill")
        view.backgroundColor = .systemBackground
    }

    private func setupNavigationBar() {
        navigationItem.title = "Items"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didPressAddButton))
    }

    @objc
    private func didPressAddButton() {
        let addItemNavigationController = UINavigationController(rootViewController: AddItemViewController(AddItemViewModel(itemManager: viewModel.itemManager, delegate: self)))
        present(addItemNavigationController, animated: true)
    }

    @objc
    private func didPressItem(_ itemName: String) {
        navigationController?.pushViewController(ItemDetailsViewController(itemName), animated: true)
    }

    private func setupCollectionView() {
        view.addSubview(collectionView)

        var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        config.showsSeparators = true

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout.list(using: config)
        collectionView.register(UICollectionViewListCell.self, forCellWithReuseIdentifier: "CollectionViewCell")

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])

    }
}

extension ItemTabViewController: ItemTabViewModelDelegate {
    func updatedItemList() {
        collectionView.reloadData()
    }
}

extension ItemTabViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        didPressItem(viewModel.itemManager.items[indexPath.row])
    }

}

extension ItemTabViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.itemManager.items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)

        var content = UIListContentConfiguration.cell()
        content.text = viewModel.itemManager.items[indexPath.row]
        cell.contentConfiguration = content

        let imageView = UIImageView(frame: .zero)
        let image = UIImage(systemName: "chevron.right")
        imageView.image = image!
        cell.contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 16),
            imageView.heightAnchor.constraint(equalToConstant: 16),
            imageView.rightAnchor.constraint(equalTo: cell.contentView.rightAnchor, constant: -16)
        ])

        return cell
    }
}
