//
//  Person.swift
//  Identical Operator
//
//  Created by E5000855 on 27/06/24.
//

import Foundation
class Person {
    var name: String
    var age: Int
    var id: Int
    var isSelected: Bool = false

    init(name: String, age: Int, id: Int) {
        self.name = name
        self.age = age
        self.id = id
    }
}
