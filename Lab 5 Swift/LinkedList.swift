//
//  insert and delete.swift
//  Lab 5 Swift
//
//  Created by Nguyen, Quang on 4/5/16.
//  Copyright © 2016 Nguyen, Quang. All rights reserved.
//


public class LinkedList<T>{

    var head: FacultyMember<T> = FacultyMember<T>()

    //***************************************
    //            INSERT FUNCTION
    //***************************************
    func insert(input: [String]){
        print("In insert function")

        let idnum:String   = input[1]
        let name:String    = input[2]
        let dept:String    = input[3]
        let title:String   = input[4]
        let pay:String     = input[5]
        
        var newNode: FacultyMember<T> = FacultyMember<T>(idnum: idnum,name: name,dept: dept,title: title,pay: pay)
        if(head.idnum=="-1"){
            head = newNode
            let printStatement = "SUCCESS: Inserted ID " + idnum + " with name " + name
            print(printStatement)
            return
        }
        else{
            var checker:    FacultyMember<T> = head
            var previous:   FacultyMember<T> = head
            while(checker.idnum != "-1"){
                if(checker.idnum==newNode.idnum || checker.name==newNode.name){
                    print("ERROR: Can't insert because the member already exists")
                }
                else if(newNode.idnum > checker.idnum){
                    previous.next = newNode
                    newNode.next = checker
                    let printStatement = "SUCCESS: Inserted ID " + idnum + " with name " + name
                    print(printStatement)
                    return
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
        let looking_id = input[1];

        var checker:    FacultyMember<T> = head
        var previous:   FacultyMember<T> = head
        while(checker.idnum != "-1"){
            if(checker.idnum==looking_id){
                previous.next = checker.next
                return
            }
            else{
                let printStatement = "SUCCESS: Deleted ID " + looking_id + " with name " + checker.name!
                previous = checker
                checker = checker.next!
                print(printStatement)
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
        let looking_idnum = (input[1]);
        let looking_name = input[2];
        let new_dept = input[3];
        print("(id) + (name) + (new_dept)")

        var checker:    FacultyMember<T> = head
        while(checker.idnum != "-1"){
            if(checker.idnum == looking_idnum && checker.name==looking_name){
                var printStatement = "SUCCESS: ID[" + looking_idnum
                printStatement += "] with name [" + looking_name
                printStatement += "] has been updated with new department[" + new_dept + "]"
                print(printStatement)
                checker.dept = new_dept;
                return
            }
            checker = checker.next!
        }
        var printStatement = "ERROR: ID" + looking_idnum + " with name "
        printStatement += looking_name + " does not exist"
        print(printStatement)
    }

    //***************************************
    //              UPDATE TITLE
    //***************************************
    func update_title(input: [String]) {
        print("In update title function")
    
        let looking_idnum = input[1];
        let looking_name = input[2]
        let new_title = input[3]

        var checker:    FacultyMember<T> = head
        while(checker.idnum != "-1"){
            if(checker.idnum == looking_idnum && checker.name==looking_name){
                checker.title = new_title;
                var printStatement = "SUCCESS: ID[" + looking_idnum
                printStatement += "] with name [" + looking_name
                printStatement += "] has been updated with new title[" + new_title + "]"
                print(printStatement)
                return
            }
            checker = checker.next!
        }
        var printStatement = "ERROR: ID" + looking_idnum + " with name "
        printStatement += looking_name + " does not exist"
        print(printStatement)
    }

    //***************************************
    //              UPDATE PAY
    //***************************************
    func update_pay(input: [String]) {
        print("In update pay function")
    
        let looking_idnum = input[1]
        let looking_name = input[2]
        let new_pay:String = input[3]

        var checker:    FacultyMember<T> = head
        while(checker.idnum != "-1"){
            if(checker.idnum == looking_idnum && checker.name==looking_name){
                var printStatement = "SUCCESS: ID[" + looking_idnum
                printStatement += "] with name [" + looking_name
                printStatement += "] has been updated with new pay[" + new_pay + "]"
                print(printStatement)
                
                checker.pay = new_pay;
                return
            }
            checker = checker.next!
        }
        var printStatement = "ERROR: ID" + looking_idnum + " with name "
        printStatement += looking_name + " does not exist"
        print(printStatement)
    }

    //***************************************
    //              PRINT ALL
    //***************************************
    func print_all() {
        var checker:    FacultyMember<T> = head
        while(checker.idnum != "-1"){
            checker.printSelf();
            checker = checker.next!
        }
    }
    //***************************************
    //              PRINT SPECIFIC ID
    //***************************************
    func print_ID(input: [String]) {
        let looking_idnum = (input[1])
        let looking_name = input[2]

        var checker:    FacultyMember<T> = head
        while(checker.idnum != "-1"){
            if(checker.idnum==looking_idnum && checker.name==looking_name){
                checker.printSelf();
                return
            }
            checker = checker.next!
        }
        var printStatement = "ERROR: Member with ID[" + looking_idnum
        printStatement += "] and name[" + looking_name + "] was not found!"
        print(printStatement)

    }

    //***************************************
    //              PRINT TITLE
    //***************************************
    func print_title(input: [String]) {
        let looking_title = input[1]
        var checker:    FacultyMember<T> = head
        while(checker.idnum != "-1"){
            if(checker.title==looking_title){
                checker.printSelf();
            }
            checker = checker.next!
        }
    }

    //***************************************
    //              PRINT DEPT
    //***************************************
    func print_department(input: [String]) {
        let looking_dept = input[1]
        var checker:    FacultyMember<T> = head
        while(checker.idnum != "-1"){
            if(checker.dept==looking_dept){
                checker.printSelf();
            }
            checker = checker.next!
        }
    }
}

