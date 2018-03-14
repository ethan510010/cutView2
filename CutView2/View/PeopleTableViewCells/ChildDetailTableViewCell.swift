 //
//  ChildDetailTableViewCell.swift
//  CutView2
//
//  Created by EthanLin on 2018/3/12.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

class ChildDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var childNOLabel: UILabel!
    @IBOutlet weak var childAgeLabel: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
