//
//  ViewController.swift
//  PrimeiroAppTableViewBootcamp
//
//  Created by Eduardo Felipe das Neves Abido on 28/07/24.
//

import UIKit

class ListViewController: UIViewController {
    
    var screen: ListScreen?
    var listName: [String] = ["Eduardo", "Caio", "Rayane", "José", "Lucas"]
    
    override func loadView() {
        screen = ListScreen()
        self.view = screen
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.tableView.delegate = self
        screen?.tableView.dataSource = self
    }
}

extension ListViewController: UITableViewDelegate {
    
}

extension ListViewController: UITableViewDataSource {
    
    // Retorna para a tableVie quntas linhas teremos na tabela
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listName.count    }
    
    // Onde configuramos a célula!!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier, for: indexPath) as? PersonTableViewCell
        cell?.setupCell(name: listName[indexPath.row])
        return cell ?? UITableViewCell()
    }
}

