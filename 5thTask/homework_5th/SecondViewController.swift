//
//  SecondViewController.swift
//  homework_5th
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 hy. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "SecondView"
        view.backgroundColor = UIColor.blue
        
        let lable = UILabel(frame: CGRect(x: 200, y: 80, width: 300, height: 150))
        lable.text = "This is Second label"
        lable.textAlignment = .center
        lable.backgroundColor = UIColor.yellow
        lable.textColor = UIColor.black
        lable.center = view.center
        view.addSubview(lable)
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
