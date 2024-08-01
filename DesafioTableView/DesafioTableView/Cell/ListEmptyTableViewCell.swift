//
//  ListEmptyTableViewCell.swift
//  DesafioTableView
//
//  Created by Eduardo Felipe das Neves Abido on 31/07/24.
//

import UIKit

class ListEmptyTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: ListEmptyTableViewCell.self)
    
    lazy var containerView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.borderColor = UIColor.black.cgColor
            view.layer.borderWidth = 2.0
            view.layer.cornerRadius = 8.0
            view.layer.masksToBounds = true
            return view
        }()
        
        lazy var nameLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 22)
            label.text = "Adicione um nome e um trabalho!!"
            label.textAlignment = .center
            label.numberOfLines = 0
            return label
        }()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            selectionStyle = .none
            addElements()
            configConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func addElements() {
            contentView.addSubview(containerView)
            containerView.addSubview(nameLabel)
        }
        
        func configConstraints() {
            NSLayoutConstraint.activate([
                containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
                
                nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
                nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
                nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
                nameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
            ])
        }

}
