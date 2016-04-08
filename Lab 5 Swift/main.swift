//
//  main.swift
//  Lab 5 Swift
//
//  Created by Nguyen, Quang on 4/5/16.
//  Copyright © 2016 Nguyen, Quang. All rights reserved.
//
import Swift
import Foundation


print("Program Begin")
var list:LinkedList<Int> = LinkedList<Int>()

let input_path = NSString(string:"~/Desktop/Lab5Data.txt").stringByExpandingTildeInPath
do {
    let contents = try NSString(contentsOfFile: input_path, encoding: NSASCIIStringEncoding)
    
    contents.enumerateLinesUsingBlock({
        
        (line, stop) -> () in
        let lineArr = line.characters.split{$0 == " "}.map(String.init)
        print("---------------------------------")
        let command = lineArr[0]
        switch command {
            case "IN": list.insert(lineArr)
            case "DE": list.delete(lineArr)
            
            case "PA": list.print_all()
            case "PI": list.print_ID(lineArr)
            case "PT": list.print_title(lineArr)
            case "PD": list.print_department(lineArr)
            
            case "UD": list.update_department(lineArr)
            case "UT": list.update_title(lineArr)
            case "UP": list.update_pay(lineArr)
            
            default: print("nothing")
        }
    })
}

print("Program End")

