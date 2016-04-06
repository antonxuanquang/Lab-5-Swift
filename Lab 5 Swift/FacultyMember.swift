import System.Collections.Generic
import System.Linq
import System.Text


class FacultyMember<T> {
    var idnum: Int!
    var name: String?
    var dept: String?
    var title: String?
    var pay: String?
    var next: FacultyMember<T>?
    init(){
    }
    init(idnum: Int, name: String, dept: String, title: String, pay: String)
    {
        self.idnum = -1
        self.name = name
        self.dept = dept
        self.title = title
        self.pay = pay
        self.next = nil
    }
}
/*
public class List<T>{
    private var head: FacultyMember<T> =  FacultyMember<T>()
    func insert(newNode: FacultyMember<T>){
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
}
*/
