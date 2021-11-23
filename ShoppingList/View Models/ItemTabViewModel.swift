//
//  ItemTabViewModel.swift
//  ShoppingList
//
//  Created by Mikael Zehnter Frisk on 12/11/2021.
//

import Foundation

final class ItemTabViewModel {
    let itemManager: ItemsManager

    init(_ itemManager: ItemsManager) {
        self.itemManager = itemManager
    }
}

protocol ItemTabViewModelDelegate: AnyObject {

    func updatedItemList()
}
