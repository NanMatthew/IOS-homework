//
//  Teacher.swift
//  homework_8th
//
//  Created by huyu on 2018/11/27.
//  Copyright © 2018年 hy. All rights reserved.
//

import Foundation

//派生类 Teacher
class Teacher:Person{
    
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
}
