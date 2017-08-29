//
//  MyCell.swift
//  NavTest
//
//  Created by AreX on 2017/8/29.
//  Copyright © 2017年 AreX. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
