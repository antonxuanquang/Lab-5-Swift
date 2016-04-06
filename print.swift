//
//  print.swift
//  Lab 5 Swift
//
//  Created by Nguyen, Quang on 4/5/16.
//  Copyright © 2016 Nguyen, Quang. All rights reserved.
//

import Foundation

let output_path = NSString(string:"~/Desktop/Lab 5 Swift/Lab 5 Swift/Lab5ANS.txt").stringByExpandingTildeInPath

func print_to_file(text: String) {
    if let outputStream = NSOutputStream(toFileAtPath: output_path, append: true) {
        outputStream.open()
        outputStream.write(text + "\n", maxLength: text.characters.count + 1)
        outputStream.close()
    } else {
        print("Unable to open file")
    }
}

func print_all() {
    print("In print all function")
}

func print_ID(input: [String]) {
    print("In print ID function")
    let id:Int? = Int(input[1])
    let name = input[2]
    
    print("\(id)    \(name)")
}

func print_title(input: [String]) {
    print("In print title function")
    let title = input[1]
    
    print("\(title)")
}

func print_department(input: [String]) {
    print("In print department function")
    let dept = input[1]
    
    print("\(dept)")
}