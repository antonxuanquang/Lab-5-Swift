﻿import System.Collections.Generic
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

    func printSelf(){
        print(idnum + "    " + name + "        " + dept + "    " + title + "       " + pay)
    }
}