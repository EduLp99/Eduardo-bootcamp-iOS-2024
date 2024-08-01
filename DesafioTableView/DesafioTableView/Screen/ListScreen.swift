//
//  ListScreen.swift
//  DesafioTableView
//
//  Created by Eduardo Felipe das Neves Abido on 31/07/24.
//

import UIKit

protocol ScreenProtocol: AnyObject {
      func tappedAddButton()
      func tappedRemoveButton()
}

class ListScreen: UIView {
    
    weak var delegate: ScreenProtocol?
    
    lazy var nameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Nome:"
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    lazy var workTextField: UITextField = {
        let pw = UITextField()
        pw.translatesAutoresizingMaskIntoConstraints = false
        pw.placeholder = "Trabalho:"
        pw.borderStyle = .roundedRect
        pw.keyboardType = .emailAddress
        return pw
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Adicionar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedAddButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedAddButton() {
        delegate?.tappedAddButton()
    }
    
    lazy var removeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Remover", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedRemoveButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedRemoveButton() {
        delegate?.tappedRemoveButton()
    }
    
    lazy var tableView: UITableView = {
      let tableView = UITableView()
      tableView.translatesAutoresizingMaskIntoConstraints = false
      tableView.register(ListEmptyTableViewCell.self, forCellReuseIdentifier: ListEmptyTableViewCell.identifier)
      tableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.identifier)
      tableView.separatorStyle = .none
      tableView.backgroundColor = .white
      return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .orange
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addElements() {
        addSubview(nameTextField)
        addSubview(workTextField)
        addSubview(addButton)
        addSubview(removeButton)
        addSubview(tableView)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            nameTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            workTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            workTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            workTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            workTextField.heightAnchor.constraint(equalToConstant: 40),
            
            addButton.topAnchor.constraint(equalTo: workTextField.bottomAnchor, constant: 20),
            addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            addButton.heightAnchor.constraint(equalToConstant: 40),
            
            removeButton.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 20),
            removeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            removeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            removeButton.heightAnchor.constraint(equalToConstant: 40),
            
            tableView.topAnchor.constraint(equalTo: removeButton.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
