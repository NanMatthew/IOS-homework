//
//  DetailViewController.swift
//  homework_12th
//
//  Created by huyu on 2018/12/16.
//  Copyright © 2018年 hy. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {

    var person:Person?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var phoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbName.text = person?.name
        phoneNumber.text = person?.phone
    }
    
    @IBAction func update(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format: "name=%@", lbName.text!)
        let persons = try?context.fetch(fetch)
        if let p = persons?.first {
            p.phone = phoneNumber.text
            appDelegate.saveContext()
            dismiss(animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
