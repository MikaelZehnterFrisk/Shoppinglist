//
//  PickItemViewModel.swift
//  ShoppingList
//
//  Created by Mikael Zehnter Frisk on 05/11/2021.
//

import Foundation

final class PickItemViewModel {
    let itemManager: ItemsManager
    var selectedItems: Set<String> = []

    init(_ itemManager: ItemsManager)
    {
        self.itemManager = itemManager
    }
}
