//
//  update.swift
//  Lab 5 Swift
//
//  Created by Nguyen, Quang on 4/5/16.
//  Copyright © 2016 Nguyen, Quang. All rights reserved.
//

func update_department(input: [String]) {
    print("In update department function")
    let id:Int? = Int(input[1])
    let name = input[2]
    let new_dept = input[3]
    
    
    print("\(id)    \(name)     \(new_dept)")
}

func update_title(input: [String]) {
    print("In update title function")
    
    let id:Int? = Int(input[1])
    let name = input[2]
    let new_title = input[3]
    
    print("\(id)    \(name)     \(new_title)")
}

func update_pay(input: [String]) {
    print("In update pay function")
    
    let id:Int? = Int(input[1])
    let name = input[2]
    let new_pay:Double? = Double(input[3])
    
    print("\(id)    \(name)     \(new_pay)")
}