//
//  PickItemViewController.swift
//  ShoppingList
//
//  Created by Mikael Zehnter Frisk on 05/11/2021.
//

import UIKit

final class PickItemViewController: UIViewController{

    var tableView = UITableView()
    let viewModel: PickItemViewModel
    weak var delegate: ListViewModelDelegate?

    init(viewModel: PickItemViewModel, delegate: ListViewModelDelegate)
    {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        navigationItem.title = "Add Items"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(didTapCancelButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDoneButton))

        navigationController?.navigationBar.prefersLargeTitles = true

        setupTableView()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
        tableView.allowsSelection = true
        tableView.delegate = self

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }

    @objc
    private func didTapCancelButton() {
        dismiss(animated: true)
    }

    @objc
    private func didTapDoneButton() {
        let items = viewModel.selectedItems.map({ Item(name: $0, done: false) })
        delegate?.didAddItems(items)
        dismiss(animated: true)
    }
}

extension PickItemViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemManager.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        cell.textLabel?.text = viewModel.itemManager.items[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        guard let cell = tableView.cellForRow(at: indexPath) else { return }

        let itemName = viewModel.itemManager.items[indexPath.row]
        let itemSelected = viewModel.selectedItems.contains(itemName)

        if itemSelected {
            viewModel.selectedItems.remove(itemName)
            cell.accessoryType = .none
        } else {
            viewModel.selectedItems.insert(itemName)
            cell.accessoryType = .checkmark
        }
    }
}
