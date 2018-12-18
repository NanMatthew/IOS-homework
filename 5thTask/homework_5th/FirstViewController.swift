//
//  FirstViewController.swift
//  homework_5th
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 hy. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "FirstView"
        view.backgroundColor = UIColor.red
        //创建label
        let lable = UILabel(frame: CGRect(x: 200, y: 80, width: 300, height: 150))
        lable.text = "This is FirstLabel"
        lable.textAlignment = .center
        lable.backgroundColor = UIColor.orange
        lable.textColor = UIColor.white
        lable.center = view.center
        view.addSubview(lable)  //加入根view中
        
        //创建button
        let button = UIButton(frame: CGRect(x: 150, y: 300, width: 100, height: 40))
        button.setTitle("click me", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.white
        view.addSubview(button) //加入根view中
        //button点击事件
        button.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        
        //创建图片
        let imgView = UIImageView(frame: CGRect(x: 0, y: 50, width: 430, height: 220))
        imgView.image = UIImage(named: "img1")
        view.addSubview(imgView)
        
        let imgView2 = UIImageView(frame: CGRect(x: 0, y: 530, width: 430, height: 300))
        imgView2.image = UIImage(named: "img2")
        view.addSubview(imgView2)
        
    }
    

    @IBAction func btnClicked(){
        if let lable = view.subviews.first as? UILabel{
            lable.text = "I was clicked!"
            lable.textColor = UIColor.yellow
            lable.backgroundColor = UIColor.red
            present(SecondViewController(),animated: true,completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
