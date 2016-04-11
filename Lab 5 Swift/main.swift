
/*************************************************************************
 *************************************************************************
 *************************************************************************
 
 Program:        Lab 5
 Students:       James Pfluger and Quang Nguyen
 Semester:       Spring 2016
 Class/Sect:     30403 - 035
 Instructor:     Dr. James Comer
 Due Date:       12 April 2016
    
 Program Overview:
    This program takes in a text file and
    This program takes input from a sudo command file then builds a
    array resembling linked list to store all the information
    The sudo command file has the following commands: IN - input a
    information of a faculty member; DE - remove stored information
    of a certain faculty; PA, PI, PT, PD - print all or some
    faculties' information; UP, UT, UD - update information of a
    faculty member
 
 Input:
    A pseudo command file
 
 Output:
    Printed faculty members and status messages about what is happening
        in the program at a given time
    Output all goes to the console
 
Program limitations:
    We assume the syntax of the input to be proper
    We say the headNode is meant to be a null node whose ID is "-1"
        and whose next pointer is null
 
 Significant program variables
    In main.swift:
    -   list : LinkedList<Int> is the linked list object
    -   contents is the contents of the file
    -   lineArr is the contents of the line
    
    In FacultyMember.swift:
    -   idnum : String holds idnum
    -   name : String holds name
    -   dept : String holds department
    -   title : String holds title
    -   pay : String holds pay
    -   next : FacultyMember<T> holds the next link in the list
    
    In LinkedList.swift:
    -   head : FacultyMember<T> holds the top head of the linked list
 
*************************************************************************
*************************************************************************
*************************************************************************/


import Swift
import Foundation


print("Program Begin")
var list:LinkedList<Int> = LinkedList<Int>()

/*
    following controls input and file reading
*/
let input_path = NSString(string:"~/Desktop/Lab5Data.txt").stringByExpandingTildeInPath
do {
    let contents = try NSString(contentsOfFile: input_path, encoding: NSASCIIStringEncoding)
    
    contents.enumerateLinesUsingBlock({
        
        (line, stop) -> () in
        let lineArr = line.characters.split{$0 == " "}.map(String.init)
        //for each command print this out to separate them out
        print("---------------------------------")
        //command is the first argument, which tells us where to go
        let command = lineArr[0]
        //this switch statement tells us which command in the LinkedList to execute
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

