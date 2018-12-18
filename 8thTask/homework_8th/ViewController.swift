//
//  ViewController.swift
//  homework_8th
//
//  Created by huyu on 2018/11/27.
//  Copyright © 2018年 hy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate {
    
    
    @IBOutlet weak var chooseLabel: UILabel!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var stuTableView: UITableView!
    
    var tableTitle = ["老师","学生"]    //标题
    var stuArray = [Student]()  //学生
    var teacherArray = [Teacher]() //老师
    
    //创建学生
    let stu1 = Student(firstName: "胡", lastName: "钰", age: 19, gender: Gender.male, stuNo: "2016070609")
    let stu2 = Student(firstName: "朱", lastName: "慧", age: 20, gender: Gender.female, stuNo: "2016110457")
    let stu3 = Student(firstName: "李", lastName: "志明", age: 19, gender: Gender.male, stuNo: "2016110415")
    
    //添加老师
    let teacher1 = Teacher(firstName: "李", lastName: "贵阳", age: 30, gender: Gender.male, title: "IOS")
    let teacher2 = Teacher(firstName: "夏", lastName: "羽", age: 32, gender: Gender.male, title: "JAVA")
    let teacher3 = Teacher(firstName: "樊", lastName: "相奎", age: 31, gender: Gender.male, title: "Android")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idTextField.returnKeyType = UIReturnKeyType.done //表示完成输入
        
        //添加数据并排序
        stuArray.append(stu1)
        stuArray.append(stu2)
        stuArray.append(stu3)
        stuArray.sort { return $0.stuNo < $1.stuNo }
        
        teacherArray.append(teacher1)
        teacherArray.append(teacher2)
        teacherArray.append(teacher3)
        teacherArray.sort{ return $0.fullName < $1.fullName }
    }
    
    @IBAction func addClicked(_ sender: Any) {
        if let id = idTextField.text {
            if let name = nameTextField.text {
                stuArray.append(Student (stuNo: id, fullName: name))
                stuTableView.reloadData()
                idTextField.text = ""
                nameTextField.text = ""
            }
        }
        idTextField.resignFirstResponder()
        nameTextField.resignFirstResponder()
    }
    
    //编辑
    @IBAction func editClicked(_ sender: Any) {
        if let row = stuTableView.indexPathForSelectedRow?.row {
            if let id = idTextField.text {
                if let name = nameTextField.text {
                    stuArray[row] = Student (stuNo: id, fullName: name)
                    stuTableView.reloadData()
                    idTextField.text = ""
                    nameTextField.text = ""
                    idTextField.resignFirstResponder()
                    nameTextField.resignFirstResponder()
                }
            }
        }
        
    }
    
    //标题
    func numberOfSections(in tableView: UITableView) -> Int {
       return tableTitle.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableTitle[section]
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        stuTableView.isEditing = !stuTableView.isEditing
    }
    
    //section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return teacherArray.count
        }else {
            return stuArray.count
        }
    }
    
    //绑定cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = tableTitle[indexPath.section]
        
        if identifier == "老师" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherCell") as! TeacherTableViewCell
            let teacher = teacherArray[indexPath.row]
            cell.id.text = teacher.title
            cell.name.text = teacher.fullName
            cell.id.sizeToFit()
            cell.name.sizeToFit()
            
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell") as! StudentTableViewCell
            let stu = stuArray[indexPath.row]
            cell.id.text = stu.stuNo
            cell.name.text = stu.fullName
            cell.id.sizeToFit()
            cell.name.sizeToFit()
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // 点击响应 显示点击的是老师还是学生
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let identifier = tableTitle[indexPath.section]
        
        if identifier == "老师" {
             chooseLabel.text = "你选择了一名\(identifier): \(teacherArray[indexPath.row].fullName)"
            
            idTextField.text = ""
            nameTextField.text = ""
        }else {
             chooseLabel.text = "你选择了一名\(identifier): \(stuArray[indexPath.row].fullName)"
            
            
            idTextField.text = stuArray[indexPath.row].stuNo
            nameTextField.text = stuArray[indexPath.row].fullName
        }
       
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            stuArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    //移动相关
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let source = stuArray.remove(at: sourceIndexPath.row)
        stuArray.insert(source, at: destinationIndexPath.row)
    }
    
    //点击空白处关闭键盘
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("响应了touchesEnded")
        idTextField.resignFirstResponder()
        nameTextField.resignFirstResponder()
        }
    
    //点击return关闭键盘
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //收起键盘
        textField.resignFirstResponder()
        print("响应了textFieldShouldReturn")
        return true;
    }
    

}

