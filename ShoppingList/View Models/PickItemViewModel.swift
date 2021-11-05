//
//  PickItemViewModel.swift
//  ShoppingList
//
//  Created by Mikael Zehnter Frisk on 05/11/2021.
//

import Foundation

final class PickItemViewModel {
    let itemManager: ItemsManager

    init(_ itemManager: ItemsManager)
    {
        self.itemManager = itemManager
    }
}
