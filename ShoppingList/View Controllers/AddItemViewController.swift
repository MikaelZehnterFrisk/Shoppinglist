//
//  AddItemViewController.swift
//  ShoppingList
//
//  Created by Mikael Zehnter Frisk on 22/11/2021.
//

import UIKit

class AddItemViewController: UIViewController {

    private var newItemName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        setupNavigationBar()
        setupStackView()
        setupAddButton()
    }

    private func setupNavigationBar() {
        navigationItem.title = "Add Item"
        navigationController?.navigationBar.backgroundColor = .lightGray
        navigationController?.navigationBar.prefersLargeTitles = true

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didTapCancelButton))
    }

    private func setupStackView() {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 8

        let label = UILabel()
        label.text = "Name of item"

        let textField = UITextField(frame: .zero)
        textField.placeholder = "Item name"
        textField.text = newItemName
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8

        view.addSubview(stackView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(textField)

        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
        ])
    }

    private func setupAddButton() {
        let button = UIButton(frame: .zero)

        button.setTitle("Add Item", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.systemBackground, for: .normal)
        button.setTitleColor(.systemBackground.withAlphaComponent(0.8), for: .selected)
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)

        view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 220),
            button.heightAnchor.constraint(equalToConstant: 44),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -44)
        ])
    }

    @objc
    private func didTapCancelButton() {
        dismiss(animated: true, completion: nil)
    }

    @objc
    private func didTapAddButton() {
        dismiss(animated: true, completion: nil)
    }

}
