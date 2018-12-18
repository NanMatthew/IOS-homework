//
//  ViewController.swift
//  homework_9_3_ScrollView_2
//
//  Created by 505007 on 2018/11/27.
//  Copyright © 2018年 hy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...7{
            let imageView = UIImageView(image: UIImage(named: "\(i)"))
            imageView.contentMode = .scaleAspectFit   //大小适配？
            imageView.frame = CGRect(x: CGFloat(i - 1) * scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            scrollView.addSubview(imageView)
            scrollView.isPagingEnabled = true
        }
        
        scrollView.contentSize = CGSize(width: 7 * scrollView.bounds.width, height: scrollView.bounds.height)
        scrollView.delegate = self
        
        pageControl.numberOfPages = 7
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = true
        
        //关闭自带tab
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    //pageControl响应滑动事件
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
    }

    //pageControl 点击事件
    @IBAction func pageControlClicked(_ sender: UIPageControl) {
        let rect = CGRect(x: CGFloat(pageControl.currentPage) * scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        scrollView.scrollRectToVisible(rect, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

