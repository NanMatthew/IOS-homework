//
//  ViewController.swift
//  homework_13_1_Thread
//
//  Created by huyu on 2018/12/16.
//  Copyright © 2018年 hy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 1
    
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.count += 1
            print("timer thread:\(Thread.current)")
            self.countLabel.text = "\(self.count)"
        }
    }


    @IBAction func sum(_ sender: Any) {
        var sum = 0
        
        DispatchQueue.global().async {
            print("sum thread:\(Thread.current)")
            for i in 1...9999999{
                sum += i
            }
            DispatchQueue.main.async {
                self.sumLabel.text = "\(sum)"
            }
        }
        
        
    }
}

