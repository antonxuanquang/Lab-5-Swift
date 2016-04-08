//import System.Collections.Generic
//import System.Linq
//import System.Text


class FacultyMember<T> {
    var idnum: String? = "-1"
    var name: String?
    var dept: String?
    var title: String?
    var pay: String?
    var next: FacultyMember<T>?
    init(){
    }
    init(idnum: String, name: String, dept: String, title: String, pay: String)
    {
        self.idnum = idnum
        self.name = name
        self.dept = dept
        self.title = title
        self.pay = pay
        self.next = nil
    }

    func printSelf(){
        var printStatement =   idnum! + "    "
        printStatement += name! + "        "
        printStatement += dept! + "    "
        printStatement += title! + "       "
        printStatement += pay!
    }
}
