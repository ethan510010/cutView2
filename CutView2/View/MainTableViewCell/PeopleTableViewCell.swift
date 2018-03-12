//
//  PeopleTableViewCell.swift
//  CutView2
//
//  Created by EthanLin on 2018/3/11.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var whiteView: UILabel!
    @IBOutlet weak var numberOfRooms: UILabel!
    @IBOutlet weak var numberOfAdult: UILabel!
    @IBOutlet weak var numberOfChild: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
