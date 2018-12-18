//
//  Student.swift
//  homework_8th
//
//  Created by huyu on 2018/11/27.
//  Copyright © 2018年 hy. All rights reserved.
//

import Foundation

//派生类 Student
class Student:Person {
    
    var stuNo:String
    
    init(firstName: String, lastName: String, age: Int, gender: Gender,stuNo:String) {
        self.stuNo = stuNo
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    
    convenience init(lastName:String){
        self.init(firstName: "Hu", lastName: lastName, age: 20, gender: Gender.female, stuNo: "20161104xx")
    }
    
    convenience init(stuNo:String,fullName:String){
        self.init(firstName: "", lastName: fullName, age: 20, gender: Gender.male, stuNo: stuNo)
    }
    
    override var description: String{
        return super.description+"stuNo: \(stuNo)\n"
    }
    
}
