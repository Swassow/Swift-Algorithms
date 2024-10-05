//
//  main.swift
//  PriorityQueueSwift
//
//  Created by Swassow on 1/10/24.
//

import Foundation

let person1 = Person(name: "ABC", age: 20, priority: 10)
let person2 = Person(name: "DEF", age: 30, priority: 5)
let person3 = Person(name: "GHI", age: 40, priority: 20)
let person4 = Person(name: "JKL", age: 50, priority: 15)

var persons: [Person] = []
persons.append(person1)
persons.append(person2)
persons.append(person3)
persons.append(person4)

let pq = PriorityQueue(persons, sort: { $0.age < $1.age })
while(pq.size() != 0) {
    
    print(pq.top().name, pq.top().age, pq.top().priority)
    pq.pop()
}

