//
//  ListTabViewModel.swift
//  ShoppingList
//
//  Created by Mikael Zehnter Frisk on 01/11/2021.
//

import Foundation

class ListTabViewModel {

    private let itemsManager: ItemsManager

    init(_ itemsManager: ItemsManager)
    {
        self.itemsManager = itemsManager
    }

    func createListViewModel() -> ShoppingListViewModel {
        let listViewModel = ShoppingListViewModel(itemsManager)

        return listViewModel
    }
}
