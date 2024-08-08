//
//  ListViewModel.swift
//  PrimeiroAppTableViewBootcamp
//
//  Created by Eduardo Felipe das Neves Abido on 07/08/24.
//

import Foundation

class ListViewModel {
    
    private(set) var listPerson: [Person] = [Person(name: "Caio", lastName: "Fabrini", age: 22, image: "person.circle"),
                                Person(name: "Bárbara", lastName: "Fabrini", age: 21, image: "star.fill"),
                                Person(name: "Bárbara", lastName: "Brigolin", age: 21, image: "star.fill"),
                                Person(name: "Thiago", lastName: "Teves", age: 30, image: "person.circle"),
                                Person(name: "Matheus", lastName: "Humbro", age: 28, image: "medal.star"),
                                Person(name: "Lucas", lastName: "Costa", age: 26, image: "folder.circle"),
                                Person(name: "Alice", lastName: "Pereira", age: 20, image: "staroflife.fill")]
    
    var numberOfRowsInSection: Int {
        return listPerson.count
    }

}
