//
//  ViewController.swift
//  TableView+CollectionViewBootcamp2024
//
//  Created by Caio Fabrini on 01/08/24.
//

import UIKit

class ListViewController: UIViewController {

  var screen: ListScreen?
    var viewModel: ListViewModel = ListViewModel()

  override func loadView() {
    screen = ListScreen()
    view = screen
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    screen?.configTableViewProtocols(delegate: self, dataSource: self)
  }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return viewModel.numberOfRowsInSection
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as? DetailTableViewCell
    cell?.setupCell(detail: viewModel.loadCurrentDetail(indexPath: indexPath))
    return cell ?? UITableViewCell()
  }
}

