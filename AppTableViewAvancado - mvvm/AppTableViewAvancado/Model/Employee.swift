//
//  Employee.swift
//  AppTableViewAvancado
//
//  Created by Eduardo Felipe das Neves Abido on 29/07/24.
//

import Foundation

struct Employee: Equatable {
  var name: String
  var age: Int
  var job: String
  var salary: Double
  var isSelectedHeart: Bool

  static func == (lhs: Employee, rhs: Employee) -> Bool {
    return lhs.name == rhs.name &&
    lhs.age == rhs.age &&
    lhs.job == rhs.job &&
    lhs.salary == rhs.salary &&
    lhs.isSelectedHeart == rhs.isSelectedHeart
  }
}

