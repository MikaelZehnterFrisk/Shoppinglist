//
//  ListViewModel.swift
//  ShoppingList
//
//  Created by Mikael Zehnter Frisk on 01/11/2021.
//

import Foundation

class ListViewModel {

    var items: [Item] = [Item(name: "Kaviar", done: false), Item(name: "Formfranska", done: false)]
}

struct Item: Equatable {
    var name: String
    var done: Bool
}
