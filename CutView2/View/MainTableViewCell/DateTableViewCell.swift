//
//  DateTableViewCell.swift
//  CutView2
//
//  Created by EthanLin on 2018/3/11.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

class DateTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var startMonth: UILabel!
    @IBOutlet weak var startWeekDay: UILabel!
    
    @IBOutlet weak var endDate: UILabel!
    @IBOutlet weak var endMonth: UILabel!
    @IBOutlet weak var endWeekDay: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
