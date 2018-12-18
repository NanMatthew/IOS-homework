//
//  ViewController.swift
//  homework_9_2_AlertController
//
//  Created by 505007 on 2018/11/27.
//  Copyright © 2018年 hy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func actionSheet(_ sender: Any) {
        let alert = UIAlertController(title: "action sheet", message: "please choose color", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "RED", style: .default, handler: { (action) in
            self.view.backgroundColor = UIColor.red
        }))
        alert.addAction(UIAlertAction(title: "GREEN", style: .default, handler: { (action) in
            self.view.backgroundColor = UIColor.green
        }))
        
        //destructive
        alert.addAction(UIAlertAction(title: "BLUE", style: .destructive, handler: { (action) in
            self.view.backgroundColor = UIColor.blue
        }))
        
        //cancel
        alert.addAction(UIAlertAction(title: "WHITE", style: .cancel, handler: { (action) in
            self.view.backgroundColor = UIColor.white
        }))
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func alert(_ sender: Any) {
        
        let alert = UIAlertController(title: "Alert", message: "login", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Login", style: .default, handler: { (action) in
            guard let username = alert.textFields?.first?.text,let password = alert.textFields?.last?.text else{
                return
            }
            
            print("username:\(username) password:\(password)")
        }))
        
        //cancel
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            
        }))
        
        
        alert.addTextField { (textField) in
            textField.placeholder = "username"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "password"
            textField.isSecureTextEntry = true
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

