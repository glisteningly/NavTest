//
//  PageVC.swift
//  NavTest
//
//  Created by AreX on 2017/8/27.
//  Copyright © 2017年 AreX. All rights reserved.
//

import UIKit

class PageVC: UIViewController {
    var images = [UIImage]()
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!


    override func viewDidLoad() {
        super.viewDidLoad()

        images.append(UIImage(named: "sample01.png")!)
        images.append(UIImage(named: "sample02.jpg")!)
        images.append(UIImage(named: "sample03.jpg")!)
        images.append(UIImage(named: "sample04.jpg")!)

        imageView.image = images[0]
        pageControl.numberOfPages = images.count
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func handleSwipreGesture(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case UISwipeGestureRecognizerDirection.left:
            if pageControl.currentPage < images.count {
                pageControl.currentPage += 1
            }

        case UISwipeGestureRecognizerDirection.right:
            if pageControl.currentPage > 0 {
                pageControl.currentPage -= 1
            }
        default:
            return
        }
        imageView.image = images[pageControl.currentPage]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
