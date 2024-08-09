//
//  DeatilTableViewCellViewModel.swift
//  TableView+CollectionViewBootcamp2024
//
//  Created by Eduardo Felipe das Neves Abido on 08/08/24.
//

import Foundation

class DetailTableViewCellViewModel {
    
    private var list: [Item] = []
    
    func setup(detail: Detail) {
        list = detail.list
    }
    
    var numberOfRowsInSection: Int {
        return list.count
    }
    
    func loadCurrentItem(indexPath: IndexPath) -> Item {
        return list[indexPath.row]
    }
    
    func loadText(indexPath: IndexPath) -> String {
        return list[indexPath.row].text
    }
    
}
