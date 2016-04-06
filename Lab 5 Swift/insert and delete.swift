//
//  insert and delete.swift
//  Lab 5 Swift
//
//  Created by Nguyen, Quang on 4/5/16.
//  Copyright © 2016 Nguyen, Quang. All rights reserved.
//

func insert(input: [String]) {
    print("In insert function")
    let id:Int? = Int(input[1])
    let name = input[2]
    let dept = input[3]
    let title = input[4]
    let pay:Double? = Double(input[5])
    
    print("\(id)    \(name)     \(dept)      \(title)     \(pay)")
}

func delete(input: [String]) {
    print("In delete function")
    let id:Int? = Int(input[1])
    print("\(id)")
}

