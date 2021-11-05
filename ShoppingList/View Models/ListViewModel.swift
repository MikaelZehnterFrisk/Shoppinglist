//
//  ListViewModel.swift
//  ShoppingList
//
//  Created by Mikael Zehnter Frisk on 01/11/2021.
//

import Foundation

class ListViewModel {

    weak var delegate: ListViewModelDelegate?
    private(set) var items: [Item] = [Item(name: "Kaviar", done: false), Item(name: "Formfranska", done: false)]
    private let itemsManager: ItemsManager

    init(_ itemsManager: ItemsManager)
    {
        self.itemsManager = itemsManager
    }

    func addItem(_ item: Item) {
        items.append(item)
        delegate?.viewModelDidUpdateList(self)
    }

    func toggleDone(for item: Item) {
        guard let index = items.firstIndex(of: item) else {
            return
        }
        items[index].done.toggle()
        delegate?.viewModelDidUpdateList(self)
    }
}

struct Item: Equatable {
    let id = UUID()
    var name: String
    var done: Bool
}


protocol ListViewModelDelegate: AnyObject {

    func viewModelDidUpdateList(_ viewModel: ListViewModel)
}
