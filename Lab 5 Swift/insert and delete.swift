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
        let looking_id:Int? = (input[1]).toInt()
        print("\(looking_id)")

        var checker:    FacultyMember<T> = head
        var previous:   FacultyMember<T> = head
        while(checker != nil){
            if(checker.idnum==looking_id){
                previous.next = checker.next
                return
            }
            else{
                previous = checker
                checker = checker.next!
            }
        }
        //if we get to this point, the ID does not exist!
        print("ERROR: ID" + looking_id + " does not exist")
    }

    //***************************************
    //          UPDATE DEPARTMENT
    //***************************************
    func update_department(input: [String]) {
        print("In update department function")
        let looking_idnum:Int? = (input[1]).toInt()
        let looking_name = input[2]
        let new_dept = input[3]       
        print("(id) + (name) + (new_dept)")

        var checker:    FacultyMember<T> = head
        while(checker!=nil){
            if(checker.idnum == looking_idnum && checker.name==looking_name){
                print("SUCCESS: ID[" + looking_idnum + "] with name [" + looking_name + "] has been updated with new department[" + new_dept + "]")
                checker.dept = new_dept;
                return
            }
        }
        print("ERROR: ID" + looking_idnum + " with name " + looking_name + " does not exist")
    }

    //***************************************
    //              UPDATE TITLE
    //***************************************
    func update_title(input: [String]) {
        print("In update title function")
    
        let looking_idnum:Int? = (input[1]).toInt()
        let looking_name = input[2]
        let new_title = input[3]

        var checker:    FacultyMember<T> = head
        while(checker!=nil){
            if(checker.idnum == looking_idnum && checker.name==looking_name){
                checker.title = new_title;
                print("SUCCESS: ID[" + looking_idnum + "] with name [" + looking_name + "] has been updated with new title[" + new_title + "]")
                return
            }
        }
        print("ERROR: ID" + looking_idnum + " with name " + looking_name + " does not exist")
    }

    //***************************************
    //              UPDATE PAY
    //***************************************
    func update_pay(input: [String]) {
        print("In update pay function")
    
        let looking_idnum:Int? = (input[1]).toInt()
        let looking_name = input[2]
        let new_pay:String? = (input[3])

        var checker:    FacultyMember<T> = head
        while(checker!=nil){
            if(checker.idnum == looking_idnum && checker.name==looking_name){
                print("SUCCESS: ID[" + looking_idnum + "] with name [" + looking_name + "] has been updated with new pay[" + new_pay + "]")
                checker.pay = new_pay;
                return
            }
        }
        print("ERROR: ID" + looking_idnum + " with name " + looking_name + " does not exist")
    }
}

