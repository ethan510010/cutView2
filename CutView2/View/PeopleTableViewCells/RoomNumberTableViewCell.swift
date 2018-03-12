//
//  RoomNumberTableViewCell.swift
//  CutView2
//
//  Created by EthanLin on 2018/3/11.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

protocol changeRoomsCountDelegate {
    func minusRooms(numberOfRooms:Int)
    func plusRooms(numberOfRooms:Int)
}

class RoomNumberTableViewCell: UITableViewCell {
    
    var delegate:changeRoomsCountDelegate?
    
    var numberOfRooms:Int?
    
    @IBOutlet weak var roomNumber: UILabel!
    
    @IBAction func minus(_ sender: UIButton) {
        if var numbers = Int(roomNumber.text!){
            if numbers > 1{
                numbers -= 1
                
            }else{
                numbers = 1
            }
            roomNumber.text = "\(numbers)"
            numberOfRooms = numbers
        }
        if let numberOfRooms = numberOfRooms{
            delegate?.minusRooms(numberOfRooms: numberOfRooms)
        }
        
        
    }
    
    @IBAction func plus(_ sender: UIButton) {
        if var numbers = Int(roomNumber.text!){
            if numbers < 9{
                numbers += 1
                
            }else{
                numbers = 9
            }
            roomNumber.text = "\(numbers)"
            numberOfRooms = numbers
        }
        if let numberOfRooms = numberOfRooms{
            delegate?.plusRooms(numberOfRooms: numberOfRooms)
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
