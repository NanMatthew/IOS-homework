//
//  ViewController.swift
//  homework_9_3_ScrollView
//
//  Created by 505007 on 2018/11/27.
//  Copyright © 2018年 hy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(image: UIImage(named: "1"))
        scrollView.addSubview(imageView)
        scrollView.contentSize = imageView.bounds.size
        scrollView.minimumZoomScale = 0.2
        scrollView.maximumZoomScale = 5
        scrollView.delegate = self
    }
    
    //实现图片缩放
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scrollView.subviews.first
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

