//
//  AddItemViewModel.swift
//  ShoppingList
//
//  Created by Mikael Zehnter Frisk on 23/11/2021.
//

import Foundation

class AddItemViewModel {
    let itemManager: ItemsManager

    weak var delegate: ItemTabViewModelDelegate?

    init(itemManager: ItemsManager, delegate: ItemTabViewModelDelegate) {
        self.itemManager = itemManager
        self.delegate = delegate
    }
}
