//
//  ChildTableViewCell.swift
//  CutView2
//
//  Created by EthanLin on 2018/3/11.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

protocol changeChildsCountDelegate {
    func minusChilds(numberOfChilds:Int)
    func plusChilds(numberOfChilds:Int)
}

class ChildTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var childsNumberLabel: UILabel!
        
    
    @IBAction func minusChilds(_ sender: UIButton) {
        if var numberOfChilds = Int(childsNumberLabel.text!){
            if numberOfChilds > 1{
                numberOfChilds -= 1
                
            }else{
                numberOfChilds = 1
            }
            childsNumberLabel.text = "\(numberOfChilds)"
            childsNumber = numberOfChilds
        }
        if let numberOfChilds = childsNumber{
            delegate?.minusChilds(numberOfChilds: numberOfChilds)
        }
    }
    
    
    @IBAction func plusChilds(_ sender: UIButton) {
        if var numberOfChilds = Int(childsNumberLabel.text!){
            if numberOfChilds < 9{
                numberOfChilds += 1
                
            }else{
                numberOfChilds = 9
            }
            childsNumberLabel.text = "\(numberOfChilds)"
            childsNumber = numberOfChilds
        }
        if let numberOfChilds = childsNumber{
            delegate?.minusChilds(numberOfChilds: numberOfChilds)
        }
    }
    
    
    @IBOutlet weak var plusChilds: UIButton!
    
    var delegate:changeChildsCountDelegate?
    
    var childsNumber:Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
