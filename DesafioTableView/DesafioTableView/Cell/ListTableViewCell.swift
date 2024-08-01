//
//  ListTableViewCell.swift
//  DesafioTableView
//
//  Created by Eduardo Felipe das Neves Abido on 31/07/24.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: ListTableViewCell.self)

    lazy var nameLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.textColor = .black
      label.font = UIFont.boldSystemFont(ofSize: 22)
      label.text = "Caio Fabrini"
      return label
    }()

    lazy var workNameLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.textColor = .black
      label.font = UIFont.boldSystemFont(ofSize: 22)
      label.text = "22 anos"
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
      contentView.addSubview(nameLabel)
      contentView.addSubview(workNameLabel)
    }

    func configConstraints() {
      NSLayoutConstraint.activate([
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),

        workNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
        workNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
        workNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
      ])
    }

    func setupCell(user: User) {
        nameLabel.text = "Nome: \(user.name)"
        workNameLabel.text = "Profissão: \(user.job)"
    }

  }
