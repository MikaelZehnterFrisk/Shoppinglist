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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Items"
    }

    init() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        super.init(nibName: nil, bundle: nil)
        setupTabBarItem()
        setupCollectionView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupTabBarItem() {
        tabBarItem.title = "Items"
        tabBarItem.image = UIImage(systemName: "heart.fill")
        view.backgroundColor = .systemBackground
    }

    func setupCollectionView() {

        view.addSubview(collectionView)

        //collectionView.dataSource = self

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])

    }
}

extension ItemTabViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        fatalError("Not yet implemented")
    }
}
