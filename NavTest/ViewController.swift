//
//  ViewController.swift
//  NavTest
//
//  Created by AreX on 2017/6/27.
//  Copyright © 2017年 AreX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "unwind_vc_to_myvc" {
            let vc = unwindSegue.source as! MyViewController
            if let str = vc.str {
                print(str)
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_vc_to_myvc" {
            let vc = segue.destination as! MyViewController
            vc.str = "hello!"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

