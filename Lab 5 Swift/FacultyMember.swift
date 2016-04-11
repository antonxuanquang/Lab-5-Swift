
/*
 Class that holds a faculty member's data
 */

class FacultyMember<T> {
    var idnum: String? = "-1"//holds idnum
    var name: String?//holds name
    var dept: String?//holds department
    var title: String?//holds title
    var pay: String?//holds pay
    var next: FacultyMember<T>?//holds the next link in the list
    init(){
        idnum = "-1"//set an empty member to have a -1 idnum
        next = nil//set an empty member to have a nil next value
        
    }
    init(idnum: String, name: String, dept: String, title: String, pay: String)
    {
        self.idnum = idnum//take in the idnum and save it
        self.name = name//take in the name and save it
        self.dept = dept//take in the department and save it
        self.title = title//take in the title and save it
        self.pay = pay//take in the pay and save it
        self.next = nil//set the initial next value to be nil
    }

    /*
    Print out all information about itself
    */
    func printSelf(){
        var printStatement =   idnum! + "\t"
        printStatement += name! + "  \t"
        printStatement += dept! + "\t"
        printStatement += title! + "\t"
        if(title?.characters.count<8){
            printStatement+="\t"
        }
        printStatement += pay!
        print(printStatement)
    }
}
