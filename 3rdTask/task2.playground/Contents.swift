//: Playground - noun: a place where people can play

import UIKit

//Person增加run方法(方法里面直接print输出Person XXX is running;
//Teacher和Student重载run方法(方法里面直接print输出Teacher XXX is running和Student XXX is running)
//新建一个协议SchoolProtocol，协议包括一个department属性(Enum，自己实现enum的定义)和lendBook方法（随便写点内容，能区隔即可）；
//修改Teacher和Student，让这两个类实现该协议；
//对数组进行穷举，调用每个对象的run方法，同时调用满足协议SchoolProtocol对象的lendBook方法；


enum protocolEnum {
    case teacher
    case student
}

//新建一个协议SchoolProtocol
protocol SchoolProtocol {
    var department:protocolEnum{get}
    func lendBook()
}

enum Gender:String {
    case male = "男"
    case female = "女"
}

//实现Person类
class Person:CustomStringConvertible{
    
    var firstName:String    //firstName
    var lastName:String     //lastName
    var age:Int             //age
    var gender:Gender       //gender 枚举类型
    var fullName:String{    //fullName 计算属性
        get{
            return firstName+" "+lastName
        }
    }
    
    //实现 Person实例可以直接用print输出；
    var description: String {
        return "\n"+"name: \(fullName)\n"+"age: \(age)\n"+"gender: \(gender.rawValue)\n"
    }
    
    //构造函数
    init(firstName:String,lastName:String,age:Int,gender:Gender) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    
    //便利构造函数
    convenience init(name:String){
        self.init(firstName:"Wang",lastName:name,age:20,gender:Gender.male)
    }
    
    //实现 可用==比较  判断依据：fullName相同即判断相同
    static func ==(p1:Person,p2:Person) -> Bool{
        return p1.fullName == p2.fullName
    }
    
    //实现 可用!=比较  判断依据：fullName不相同即判断不相同
    static func !=(p1:Person,p2:Person) -> Bool{
        return p1.fullName != p2.fullName
    }
    
    //Person增加run方法(方法里面直接print输出Person XXX is running;
    func run() -> Void {
        print("Person \(fullName) is running")
    }
}

//派生类 Teacher
class Teacher:Person,SchoolProtocol{
    var department: protocolEnum{ return .teacher}
    
    func lendBook() {
        print("Teacher Lend Book")
    }
    
    
    var title:String
    
    init(firstName: String, lastName: String, age: Int, gender: Gender,title:String) {
        self.title = title
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    
    convenience init(lastName:String){
        self.init(firstName: "Li", lastName: lastName, age: 35, gender: Gender.female, title: "计算机")
    }
    
    override var description: String{
        return super.description+"title: \(title)\n"
    }
    
    //Teacher重载run方法(方法里面直接print输出Teacher XXX is running和Student XXX is running)
    override func run() {
        print("Teacher \(fullName) is running")
    }
}

//派生类 Student
class Student:Person,SchoolProtocol {
    var department: protocolEnum {return .student}
    
    func lendBook() {
        print("Student lend Book")
    }
    
    
    var stuNo:String
    
    init(firstName: String, lastName: String, age: Int, gender: Gender,stuNo:String) {
        self.stuNo = stuNo
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    
    convenience init(lastName:String){
        self.init(firstName: "Hu", lastName: lastName, age: 20, gender: Gender.female, stuNo: "20161104xx")
    }
    
    override var description: String{
        return super.description+"stuNo: \(stuNo)\n"
    }
    
    //Student重载run方法(方法里面直接print输出Teacher XXX is running和Student XXX is running)
    override func run() {
        print("Student \(fullName) is running")
    }
}

var person = Person(firstName: "hu", lastName: "yu", age: 20, gender: Gender.male)
var student = Student(firstName: "hu", lastName: "yu", age: 20, gender: Gender.male, stuNo: "2016070609")
var teacher = Teacher(firstName: "li", lastName: "guiyang", age: 40, gender: Gender.male, title: "IOS")

let PersonArr = [person,student,teacher]
//对数组进行穷举，调用每个对象的run方法，同时调用满足协议SchoolProtocol对象的lendBook方法；
for person in PersonArr {
    person.run()
    if let s=person as? Student{
        s.lendBook()
    }else if let t=person as? Teacher{
        t.lendBook()
    }else {
        print("不满足SchoolProtocol协议")
    }
    print("")
}




