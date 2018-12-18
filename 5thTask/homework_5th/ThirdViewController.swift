//
//  ThirdViewController.swift
//  homework_5th
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 hy. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "ThirldView"
        view.backgroundColor = UIColor.green
        
        let lable = UILabel(frame: CGRect(x: 200, y: 80, width: 300, height: 150))
        lable.text = "This is Third label"
        lable.textAlignment = .center
        lable.backgroundColor = UIColor.blue
        lable.textColor = UIColor.white
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
