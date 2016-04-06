//
//  main.swift
//  Lab 5 Swift
//
//  Created by Nguyen, Quang on 4/5/16.
//  Copyright © 2016 Nguyen, Quang. All rights reserved.
//

import Foundation


print("Program Begin")

let input_path = NSString(string:"~/Desktop/Lab 5 Swift/Lab 5 Swift/Lab5Data.txt").stringByExpandingTildeInPath
do {
    let contents = try NSString(contentsOfFile: input_path, encoding: NSASCIIStringEncoding)
    
    contents.enumerateLinesUsingBlock({
        
        (line, stop) -> () in
        let lineArr = line.characters.split{$0 == " "}.map(String.init)
        print("---------------------------------")
        let command = lineArr[0]
        switch command {
            case "IN": insert(lineArr)
            case "DE": delete(lineArr)
            
            case "PA": print_all()
            case "PI": print_ID(lineArr)
            case "PT": print_title(lineArr)
            case "PD": print_department(lineArr)
            
            case "UD": update_department(lineArr)
            case "UT": update_title(lineArr)
            case "UP": update_pay(lineArr)
            
            default: print("nothing")
        }
    })
}

print("Program End")

