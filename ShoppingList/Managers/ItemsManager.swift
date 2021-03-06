//
//  AvailableItemManager.swift
//  ShoppingList
//
//  Created by Mikael Zehnter Frisk on 05/11/2021.
//

import Foundation

final class ItemsManager {
    private(set) var items: [String] = []

    func addItem(_ item: String) throws {
        if items.contains(item) {
            throw Error.itemExists
        }
        items.append(item)
    }

    enum Error: Swift.Error {
        case itemExists
    }
}
