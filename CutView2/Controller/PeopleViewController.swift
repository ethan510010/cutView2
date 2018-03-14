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

protocol numberOfChildsDelegate {
    func getChildsCount(childs:Int)
}

class PeopleViewController: UIViewController, changeRoomsCountDelegate, changeAdultsCountDelegate, changeChildsCountDelegate {
    
    
    var numberOfRows:Int?
    
    //實作一個方法來生成childArray
    func howManyChilds(childsCount:Int){
        children.childArray = [Child]()
        for i in 0..<childsCount {
            children.childArray.append(Child(childName: "兒童\(i+1)", childAge: "12歲"))
        }
    }
    
    func minusChilds(numberOfChilds: Int) {
        childsCount = numberOfChilds
        //呼叫上述建造childArray的方法，去生成該array
        howManyChilds(childsCount: childsCount!)
        print(childsCount)
        tableView.reloadData()
    }
    
    func plusChilds(numberOfChilds: Int) {
        childsCount = numberOfChilds
        //呼叫上述建造childArray的方法，去生成該array
        howManyChilds(childsCount: childsCount!)
        print(childsCount)
        tableView.reloadData()
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
    var childsCount:Int?
    
    //實體化children Model
    var children = Children()
    
    
    //
    var roomDelegate:numberOfRoomsDelegate?
    var adultDelegate:numberOfAdultsDelegate?
    var childsDelegate:numberOfChildsDelegate?
    

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func backToMainView(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func ensureNumber(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
//        print("\(roomDelegate)")
        roomDelegate?.getRoomsCount(rooms: roomsCount!)
        adultDelegate?.getAdultsCount(adults: adultsCount!)
        childsDelegate?.getChildsCount(childs: childsCount!)
    }
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.separatorStyle = .none
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

//        print("\(self.roomDelegate)")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        howManyChilds(childsCount: childsCount!)
        print("appear: \(childsCount!)")
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
        if childsCount != 0{
            tableView.isScrollEnabled = true
            numberOfRows = 4 + childsCount!
            print("numberOfRows: \(numberOfRows!)")
            return 4 + childsCount!
        }else{
            tableView.isScrollEnabled = false
            numberOfRows = 4
            return 4
        }
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
            childCell.delegate = self
            childCell.childsNumberLabel.text = "\(childsCount!)"
            return childCell
        case 3:
            if childsCount == 0{
                let descriptionCell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell", for: indexPath) as! DescriptionTableViewCell
                descriptionCell.withChildLabel.text = "有帶小孩同行嗎？"
                descriptionCell.ensureEnterChildInfo.text = "確實填寫小孩人數與年齡，我們就能幫你找出最划算的的房價和房型喔!"
                descriptionCell.childAgeLabel.text = ""
                descriptionCell.enterChildAge.text = ""
                return descriptionCell
            }else {
                let anotherKindOfDescriptionCell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell", for: indexPath) as! DescriptionTableViewCell
                anotherKindOfDescriptionCell.withChildLabel.text = ""
                anotherKindOfDescriptionCell.ensureEnterChildInfo.text = ""
                anotherKindOfDescriptionCell.childAgeLabel.text = "兒童年齡"
                anotherKindOfDescriptionCell.enterChildAge.text = "請輸入每位兒童的年齡以便尋找最適合的房型和床型組合。"
                return anotherKindOfDescriptionCell
            }
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "childDetailCell", for: indexPath) as! ChildDetailTableViewCell
            print("index:\(indexPath.row - 4)")
            print(children.childArray)
            cell.childNOLabel.text = children.childArray[indexPath.row - 4].childName
            
            cell.childAgeLabel.text = children.childArray[indexPath.row - 4].childAge
            
            return cell
        }
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row >= 4{
            //當點擊到row >= 4的列時，就跳出另外一個ViewController
            let slightBlackVC = storyboard?.instantiateViewController(withIdentifier: "slightBlackViewController") as! SlightBlackViewController
            slightBlackVC.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            
            //把peopleViewController的值傳到SlightBlackViewController的whichChildBeSelected
            slightBlackVC.whichChildBeSelected = children.childArray[indexPath.row - 4].childName
            
            //為了讓SlightBlackViewController要能夠從後面傳過來要設delegate
            slightBlackVC.index = indexPath
            slightBlackVC.delegate = self
            
            self.present(slightBlackVC, animated: true, completion: nil)
        }
        
    }
    
}

extension PeopleViewController: ChildAgeSelectionDelegate{
    
    func whichAgeDidSelected(index: IndexPath, age: String) {
        //howManyChilds(childsCount: childsCount!)
        self.tableView.reloadData()
        print(age)
        children.childArray[index.row - 4].childAge = age
        print(children.childArray[index.row - 4].childName)
        print("didselected:\(children.childArray[index.row-4].childAge)")
        
    }

}

