//
//  AdultNumberTableViewCell.swift
//  CutView2
//
//  Created by EthanLin on 2018/3/11.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit


protocol changeAdultsCountDelegate {
    func minusAdults(numberOfAdults:Int)
    func plusAdults(numberOfAdults:Int)
}


class AdultNumberTableViewCell: UITableViewCell {
    
    var delegate:changeAdultsCountDelegate?
    
    var adultsNumber:Int?
    
    @IBOutlet weak var adultsNumberLabel: UILabel!
    
    @IBAction func minusAdult(_ sender: UIButton) {
        if var numbersOfAdults = Int(adultsNumberLabel.text!){
            if numbersOfAdults > 1{
                numbersOfAdults -= 1
            }else{
                numbersOfAdults = 1
            }
            adultsNumberLabel.text = "\(numbersOfAdults)"
            adultsNumber = numbersOfAdults
        }
        if let adultsNumber = adultsNumber{
            delegate?.minusAdults(numberOfAdults: adultsNumber)
        }
    }
    
    @IBAction func plusAdult(_ sender: UIButton) {
        if var numbersOfAdults = Int(adultsNumberLabel.text!){
            if numbersOfAdults < 36{
                numbersOfAdults += 1
            }else{
                numbersOfAdults = 36
            }
            adultsNumberLabel.text = "\(numbersOfAdults)"
            adultsNumber = numbersOfAdults
        }
        if let adultsNumber = adultsNumber{
            delegate?.plusAdults(numberOfAdults: adultsNumber)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
