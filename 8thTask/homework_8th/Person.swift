//
//  Person.swift
//  homework_8th
//
//  Created by huyu on 2018/11/27.
//  Copyright © 2018年 hy. All rights reserved.
//

import Foundation

enum Gender:String {
    case male = "男"
    case female = "女"
}

//实现Person类
class Person:CustomStringConvertible {
    
    var firstName:String    //firstName
    var lastName:String     //lastName
    var age:Int             //age
    var gender:Gender       //gender 枚举类型
    var fullName:String{    //fullName 计算属性
        get{
            return firstName + lastName
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
    
}
