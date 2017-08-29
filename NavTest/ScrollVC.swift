//
//  ScrollVC.swift
//  NavTest
//
//  Created by AreX on 2017/8/22.
//  Copyright © 2017年 AreX. All rights reserved.
//

import UIKit

class ScrollVC: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    let imageView = UIImageView(image: UIImage(named: "sample01.png")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.contentMode = .scaleAspectFit
        scrollView.addSubview(imageView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        imageView.frame = scrollView.bounds
        
        //取得图片缩小后的长宽
        let size = getImageSizeAfterAspectFit()
        imageView.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)

        scrollView.contentSize = imageView.frame.size
    }
    
    func getImageSizeAfterAspectFit() -> CGSize {
        guard imageView.image != nil else {
            return CGSize(width: 0, height: 0)
        }
        
        let widthRadio = imageView.bounds.size.width / imageView.image!.size.width
        let heightRadio = imageView.bounds.size.width / imageView.image!.size.width
        
        let scale = (widthRadio > heightRadio) ? heightRadio : widthRadio
        let imageWidth = scale * imageView.image!.size.width
        let imageHeight = scale * imageView.image!.size.height
        
        return CGSize(width: imageWidth, height: imageHeight)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
