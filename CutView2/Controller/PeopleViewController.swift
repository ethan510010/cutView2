//
//  PeopleViewController.swift
//  CutView2
//
//  Created by EthanLin on 2018/3/11.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit


protocol numberOfRoomsDelegate {
    func getRoomsCount(rooms:Int)
}

protocol numberOfAdultsDelegate {
    func getAdultsCount(adults:Int)
}

class PeopleViewController: UIViewController, changeRoomsCountDelegate, changeAdultsCountDelegate, changeChildsCountDelegate {
    
    
    func minusChilds(numberOfChilds: Int) {
        <#code#>
    }
    
    func plusChilds(numberOfChilds: Int) {
        <#code#>
    }
    
    
    
    func minusAdults(numberOfAdults: Int) {
        adultsCount = numberOfAdults
    }
    
    func plusAdults(numberOfAdults: Int) {
        adultsCount = numberOfAdults
    }
    
    
    
    func minusRooms(numberOfRooms: Int) {
        roomsCount = numberOfRooms
    }
    
    func plusRooms(numberOfRooms: Int) {
        roomsCount = numberOfRooms
    }
    
    
    //
    var roomsCount:Int?
    var adultsCount:Int?
    
    //
    var roomDelegate:numberOfRoomsDelegate?
    var adultDelegate:numberOfAdultsDelegate?

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func backToMainView(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func ensureNumber(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        print("\(roomDelegate)")
        roomDelegate?.getRoomsCount(rooms: roomsCount!)
        adultDelegate?.getAdultsCount(adults: adultsCount!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("\(self.roomDelegate)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension PeopleViewController:UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let roomCell =  tableView.dequeueReusableCell(withIdentifier: "roomCell", for: indexPath) as! RoomNumberTableViewCell
            roomCell.roomNumber.text = "\(roomsCount!)"
            roomCell.delegate = self
            return roomCell
        case 1:
            let adultCell = tableView.dequeueReusableCell(withIdentifier: "adultCell", for: indexPath) as! AdultNumberTableViewCell
            adultCell.adultsNumberLabel.text = "\(adultsCount!)"
            adultCell.delegate = self
            return adultCell
        case 2:
            let childCell = tableView.dequeueReusableCell(withIdentifier: "childCell", for: indexPath) as! ChildTableViewCell
            return childCell
        default:
            let cell = UITableViewCell()
            return cell
        }
       
        
    }
}
