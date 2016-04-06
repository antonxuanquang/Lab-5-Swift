//
//  insert and delete.swift
//  Lab 5 Swift
//
//  Created by Nguyen, Quang on 4/5/16.
//  Copyright © 2016 Nguyen, Quang. All rights reserved.
//


public class List<T>{

    private var head: FacultyMember<T> =  FacultyMember<T>()

    //***************************************
    //            INSERT FUNCTION
    //***************************************
    func insert(input: [String]){
        print("In insert function")

        let id:Int?     = input[1].toInt()
        let name        = input[2]
        let dept        = input[3]
        let title       = input[4]
        let pay         = input[5]

        print("\(id)    \(name)     \(dept)      \(title)     \(pay)")

        var newNode: FacultyMember<T> = FacultyMember<T>()
        if(newNode==nil){
            head = newNode
            return
        }
        else{
            var checker:    FacultyMember<T> = head
            var previous:   FacultyMember<T> = head
            while(checker != nil){
                if(checker.idnum==newNode.idnum || checker.name==newNode.name){
                    print("ERROR: Can't insert because the member already exists")
                }
                else if(newNode.idnum>checker.idnum){
                    previous.next = newNode
                    newNode.next = checker
                }
                else{
                    previous = checker
                    checker = checker.next!
                }
            }
        }
    }

    //***************************************
    //          DELETE FUNCTION
    //***************************************
    func delete(input: [String]) {
        print("In delete function")
        let remove_this_id:Int? = (input[1]).toInt()
        print("\(remove_this_id)")

        var checker:    FacultyMember<T> = head
        var previous:   FacultyMember<T> = head
        while(checker != nil){
            if(checker.idnum==remove_this_id){
                previous.next = checker.next
                return
            }
            else{
                previous = checker
                checker = checker.next!
            }
        }
        //if we get to this point, the ID does not exist!
        print("ERROR: ID" + remove_this_id + " does not exist")
    }
}

