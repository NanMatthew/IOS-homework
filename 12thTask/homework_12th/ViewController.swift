//
//  ViewController.swift
//  homework_12th
//
//  Created by huyu on 2018/12/16.
//  Copyright © 2018年 hy. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(NSHomeDirectory())
    }

    @IBAction func add(_ sender: Any) {
        let person = Person(context: context)
        person.name = name.text
        person.phone = phone.text
        appDelegate.saveContext()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    //    @IBAction func update(_ sender: Any) {
//        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
//        fetch.predicate = NSPredicate(format: "name=%@", name.text!)
//        let persons = try?context.fetch(fetch)
//        if let p = persons?.first {
//            p.phone = phone.text
//        }
//    }
//
//    @IBAction func deleteBtn(_ sender: Any) {
//        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
//        fetch.predicate = NSPredicate(format: "name=%@", name.text!)
//        let persons = try?context.fetch(fetch)
//        if let p = persons?.first {
//            context.delete(p)
//        }
//    }
//
//    @IBAction func query(_ sender: Any) {
//        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
//        fetch.predicate = NSPredicate(format: "name=%@", name.text!)
//        let persons = try?context.fetch(fetch)
//        if let p = persons?.first {
//            phone.text = p.phone
//        }
//    }
}

