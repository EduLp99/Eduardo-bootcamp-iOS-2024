//
//  ViewController.swift
//  DesafioTableView
//
//  Created by Eduardo Felipe das Neves Abido on 31/07/24.
//

import UIKit

class ListViewController: UIViewController {
    
    var screen: ListScreen?
    
    var list: [User] = []
    
    override func loadView() {
        screen = ListScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.tableView.dataSource = self
        screen?.delegate = self
    }
    
    func showAlert(title: String, message: String) {
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let ok = UIAlertAction(title: "OK", style: .cancel)
      alert.addAction(ok)
      present(alert, animated: true)
    }
    
    func userExists(name: String, job: String) -> Bool {
      return list.contains { $0 == User(name: name, job: job) }
    }

    func addUser(name: String, job: String) {
      list.append(User(name: name, job: job))
      screen?.tableView.reloadData()
    }

    func removeUser(name: String, job: String) {
      list.removeAll { $0 == User(name: name, job: job) }
      screen?.tableView.reloadData()
    }
}

extension ListViewController: ScreenProtocol {
    func tappedAddButton() {
        let name = screen?.nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let job = screen?.workTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

        if name.isEmpty || job.isEmpty {
          showAlert(title: "Atenção!", message: "Preencha todas as informações para adicionar")
        } else if userExists(name: name, job: job) {
          showAlert(title: "Atenção!", message: "Já contém esse usuário")
        } else {
          addUser(name: name, job: job)
        }
    }
    
    func tappedRemoveButton() {
        guard let name = screen?.nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              !name.isEmpty,
              let job = screen?.workTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              !job.isEmpty else {
          showAlert(title: "Atenção!", message: "Preencha todas as informações para remover o item")
          return
        }

        removeUser(name: name, job: job)
    }
}

extension ListViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return list.isEmpty ? 1 : list.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      if list.isEmpty {
      let cell = tableView.dequeueReusableCell(withIdentifier: ListEmptyTableViewCell.identifier, for: indexPath) as? ListEmptyTableViewCell
      return cell ?? UITableViewCell()
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as? ListTableViewCell
        cell?.setupCell(user: list[indexPath.row])
      return cell ?? UITableViewCell()
    }
  }
}

