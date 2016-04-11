public class LinkedList<T>{

    var head: FacultyMember<T> = FacultyMember<T>()

    //***************************************
    //            INSERT FUNCTION
    //***************************************
    //
    //takes in the input line as a parameter
    func insert(input: [String]){
        print("Attempting to insert an member...")

        let idnum:String   = input[1]//gets the idnum from the input
        let name:String    = input[2]//gets the name from the input
        let dept:String    = input[3]//gets the dept from the input
        let title:String   = input[4]//gets the title from the input
        let pay:String     = input[5]//gets the pay from the input
        
        //creates a new node with the given data
        let newNode: FacultyMember<T> = FacultyMember<T>(idnum: idnum,name: name,dept: dept,title: title,pay: pay)
        //if the head of the list is not a valid ID, then the list is empty
        if(head.idnum=="-1"){
            head = newNode//set the head to the new node we are inserting, which is the only node in the list after we are done
            let printStatement = "SUCCESS: Inserted ID " + idnum + " with name " + name
            print(printStatement)
            return
        }
        //if the node we are inserting is less than the head, then the new node is going to be the new node
        else if(newNode.idnum<head.idnum && newNode.idnum != head.idnum){
            let tempNode: FacultyMember<T> = head;//store the current head
            newNode.next = tempNode//set the new node to point to the old head, which advances the head one forward
            head = newNode//set the head of the LinkedList to the new node we are inserting
            let printStatement = "SUCCESS: Inserted ID " + idnum + " with name " + name
            print(printStatement)
            return
        }
        else{//otherwise, we should expect it to be able to insert normally
            var checker:    FacultyMember<T>! = head//stores a variable for checking
            var previous:   FacultyMember<T>! = head//stores a variable that is immediatly behind the one we are checking
            while(checker != nil){//as long as we haven't hit the end of the list
                //if the idnums are equal, whoops we can't insert
                if(checker.idnum==newNode.idnum){
                    print("ERROR: Can't insert because the member already exists")
                    return
                }
                //if the new node's idnum is less than the one we are checking, we are inserting normallhy
                //previous is the node before the one we inserted, checker is the node after the inserted node
                else if(newNode.idnum < checker.idnum){
                    previous.next = newNode//set the node before to the new one
                    newNode.next = checker//set the new node to the next node
                    let printStatement = "SUCCESS: Inserted ID " + idnum + " with name " + name
                    print(printStatement)
                    return
                }
                //if the checker's next node is nil, then we are inserting at the end of the list
                else if(checker.next==nil){
                    checker.next = newNode//just tell the last node in the linked list to point to the new node
                    let printStatement = "SUCCESS: Inserted ID " + idnum + " with name " + name
                    print(printStatement)
                    return
                }
                else{//if none of these are the case, we haven't found a place to insert the node, so we need to change the values
                    previous = checker//change the previous node to the one we just finished checking
                    checker = checker.next//change the node we just finished checking to the next one that we haven't
                }
            }
            print("ERROR: Node fits nowhere, which shouldn't happen")
        }
    }

    //***************************************
    //          DELETE FUNCTION
    //***************************************
    //
    //takes in input line as a parameter
    func delete(input: [String]) {
        let looking_id = input[1];//this is the ID we are looking for
        print("Attempting to delete a member...")
        var checker:    FacultyMember<T>! = head//node that will be the one we are looking for; AND the node after this is the one that will be immediatly after the node we delete
        var previous:   FacultyMember<T>! = head//node that will be immediatly before the one we are looking
        while(checker != nil){//while we haven't reached the end of the list
            if(checker.idnum==looking_id){//if the idnum of our checker matches the idnum we are looking for, then we are going to delete the checker node by just not having anything point to it anymore
                previous.next = checker.next//set the pointer of the node BEFORE the one we want to delete to be
                let printStatement = "SUCCESS: Deleted ID " + looking_id + " with name " + checker.name!
                print(printStatement)
                return
            }
            else{
                previous = checker//set the previous node to the one we just checked
                checker = checker.next//set the node to the next one
            }
        }
        //if we get to this point, the ID does not exist because we went throught the entire list without finding it
        print("ERROR: ID[" + looking_id + "] does not exist")
    }

    //***************************************
    //          UPDATE DEPARTMENT
    //***************************************
    //
    //takes in the input line as a parameter
    func update_department(input: [String]) {
        print("Attempting to update the department of a member...")
        let looking_idnum = (input[1]);//need to verify the ID
        let looking_name = input[2];//need to verify the name
        let new_dept = input[3];//this will hold the value of the new department

        var checker:    FacultyMember<T>! = head//checker starts out as head; this node will be the one we update
        while(checker != nil){//while we haven't hit the end of the list
            if(checker.idnum == looking_idnum && checker.name==looking_name){//if the node we are checking matches the attributes of the one we want to update
                var printStatement = "SUCCESS: ID[" + looking_idnum
                printStatement += "] with name [" + looking_name
                printStatement += "] has been updated with new department[" + new_dept + "]"
                print(printStatement)
                checker.dept = new_dept;//update it!
                return
            }
            checker = checker.next//keep checking all the nodes
        }
        //if we get here, the member with the given name and ID do not exist in the linked list, and thus cannot be updated
        var printStatement = "ERROR: ID[" + looking_idnum + "] with name["
        printStatement += looking_name + "] does not exist"
        print(printStatement)
    }

    //***************************************
    //              UPDATE TITLE
    //***************************************
    func update_title(input: [String]) {
        print("Attempting to update the title of a member...")
    
        let looking_idnum = input[1];
        let looking_name = input[2]
        let new_title = input[3]//holds variable of the new title we are going to work with

        var checker:    FacultyMember<T>! = head//checker starts out as head; this node will be the one we update
        while(checker != nil){//while we haven't hit the end of the list
            if(checker.idnum == looking_idnum && checker.name==looking_name){//if the node we are checking matches the attributes of the one we want to update
                checker.title = new_title;//make the update
                var printStatement = "SUCCESS: ID[" + looking_idnum
                printStatement += "] with name [" + looking_name
                printStatement += "] has been updated with new title[" + new_title + "]"
                print(printStatement)
                return
            }
            checker = checker.next//keep checking all the nodes
        }
        //if we get here, the member with the given name and ID do not exist in the linked list, and thus cannot be updated
        var printStatement = "ERROR: ID[" + looking_idnum + "] with name["
        printStatement += looking_name + "] does not exist"
        print(printStatement)
    }

    //***************************************
    //              UPDATE PAY
    //***************************************
    func update_pay(input: [String]) {
        print("Attempting to update the pay of a member...")
    
        let looking_idnum = input[1]
        let looking_name = input[2]
        let new_pay:String = input[3]//holds vriable of the new pay we are going to work with

        var checker:    FacultyMember<T>! = head//checker starts out as head; this node will be the one we update
        while(checker != nil){//while we haven't hit the end of the list
            if(checker.idnum == looking_idnum && checker.name==looking_name){//if the node we are checking matches the attributes of the one we want to update
                var printStatement = "SUCCESS: ID[" + looking_idnum
                printStatement += "] with name [" + looking_name
                printStatement += "] has been updated with new pay[" + new_pay + "]"
                print(printStatement)
                
                checker.pay = new_pay;//make the update
                return
            }
            checker = checker.next//keep checking all the nodes
        }
        //if we get here, the member with the given name and ID do not exist in the linked list, and thus cannot be updated
        var printStatement = "ERROR: ID[" + looking_idnum + "] with name["
        printStatement += looking_name + "] does not exist"
        print(printStatement)
    }

    //***************************************
    //              PRINT ALL
    //***************************************
    func print_all() {
        print("Printing all members...")
        var checker:    FacultyMember<T>! = head//start out with the head
        while(checker != nil){//for each member of the list
            checker.printSelf();//print itself
            checker = checker.next//and then move to the next node
        }
    }
    //***************************************
    //              PRINT SPECIFIC ID
    //***************************************
    //
    //takes in the input line as a parameter
    func print_ID(input: [String]) {
        print("Attempting to print a specific member...")
        let looking_idnum = (input[1])//id of the member we are looking for
        let looking_name = input[2]//name of the member we are looking for
        var checker:    FacultyMember<T>! = head//start with the head
        while(checker != nil){//and check every possible ID after this
            if(checker.idnum==looking_idnum && checker.name==looking_name){//if the idnum and name match, then we found the one we want
                checker.printSelf();//print the member out that matches
                return
            }
            checker = checker.next//keep going through the IDs if we haven't found
        }
        //if we get here, then
        var printStatement = "ERROR: Member with ID[" + looking_idnum
        printStatement += "] and name[" + looking_name + "] was not found!"
        print(printStatement)

    }

    //***************************************
    //              PRINT TITLE
    //***************************************
    func print_title(input: [String]) {
        print("Printing all members with a given title")
        let looking_title = input[1]//title of the member we are looking for
        var checker:    FacultyMember<T>! = head//start with the head
        while(checker != nil){//for each item in the list
            if(checker.title==looking_title){//if the member has the same title...
                checker.printSelf();//...then print out the member
            }
            checker = checker.next//continue on to the next one
        }
    }

    //***************************************
    //              PRINT DEPT
    //***************************************
    func print_department(input: [String]) {
        print("Printing all members with a given department")
        let looking_dept = input[1]//department of the member we are looking for
        var checker:    FacultyMember<T>! = head//start with the head
        while(checker != nil){//for each item in the list
            if(checker.dept==looking_dept){//if the member has the same department...
                checker.printSelf();//...then print out the member
            }
            checker = checker.next//continue on to the next one
        }
    }
}

