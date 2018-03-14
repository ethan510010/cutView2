//
//  ViewController.swift
//  CutView2
//
//  Created by EthanLin on 2018/3/11.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, numberOfRoomsDelegate, numberOfAdultsDelegate, numberOfChildsDelegate {
    
    func getChildsCount(childs: Int) {
        print("getsChildsCount")
        numberOfChilds = childs
        mainTableView.reloadData()
    }
    
    func getAdultsCount(adults: Int) {
        print("getAdultsCount")
        numberOfAdults = adults
        mainTableView.reloadData()
    }
    
    
//    var peopleVC: PeopleViewController
    
    func getRoomsCount(rooms: Int) {
        print("getRoomsCount")
        numberOfRooms = rooms
        mainTableView.reloadData()
    }

    //為了peopleTableViewCell而設的
    var numberOfRooms:Int?
    var numberOfAdults:Int?
    var numberOfChilds:Int?
    
    //為了RatingTableViewCell而設的
    var ratingValue:Float?
    
    var starValue:String?
    //在cellForRowAt的地方把它存起來，要與後面的starsDidTapped同步才有意義，不應在這邊在新實體化
    var starArray:StarArray?
    
    
    
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        numberOfRooms = 1
        numberOfAdults = 1
        numberOfChilds = 0
        // Do any additional setup after loading the view, typically from a nib
        
//        peopleVC = PeopleViewController(nibName: "PeopleViewController", bundle: nil)
//        peopleVC.roomDelegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let searchCell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchTableViewCell
            searchCell.selectionStyle = .none
            return searchCell
        case 1:
            let dateCell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath) as! DateTableViewCell
            dateCell.selectionStyle = .none
            return dateCell
        case 2:
            let peopleCell = tableView.dequeueReusableCell(withIdentifier: "peopleCell", for: indexPath) as! PeopleTableViewCell
            peopleCell.selectionStyle = .none
            if let number = numberOfRooms {
                peopleCell.numberOfRooms.text = "\(number)"
            }
            if let numberOfAdults = numberOfAdults{
                peopleCell.numberOfAdult.text = "\(numberOfAdults)"
            }
            if let numberOfChilds = numberOfChilds{
                peopleCell.numberOfChild.text = "\(numberOfChilds)"
            }
            return peopleCell
        case 3:
            let ratingCell = tableView.dequeueReusableCell(withIdentifier: "rateCell", for: indexPath) as! RatingTableViewCell
            ratingCell.selectionStyle = .none
            
            if let ratingValue = ratingValue{
                if ratingValue > 0{
                    if ratingValue != 10{
                        ratingCell.ratingLabel.text = "\(starValue!)/評鑑：\(ratingValue)+"
                    }else{
                        ratingCell.ratingLabel.text = "\(starValue!)/評鑑：\(ratingValue)"
                    }
                }else if ratingValue == 0{
                    ratingCell.ratingLabel.text = "\(starValue!)/自訂"
                }
            }
            return ratingCell
        case 4:
            let buttonCell = tableView.dequeueReusableCell(withIdentifier: "button", for: indexPath) as! ButtonTableViewCell
            buttonCell.selectionStyle = .none
            return buttonCell
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 1:
            return 80
        default:
            return 50
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2{
            performSegue(withIdentifier: "showPeople", sender: nil)
        }else if indexPath.row == 3{
            performSegue(withIdentifier: "showBudget", sender: nil)
        }
    }
    
//    var peopleVC = PeopleViewController()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showPeople"{
            print("\(segue.destination)")
            if let NC = segue.destination as? UINavigationController {
                if let peopleVC = NC.viewControllers.first as? PeopleViewController {
                    peopleVC.roomDelegate = self
                    peopleVC.adultDelegate = self
                    peopleVC.childsDelegate = self
                    peopleVC.roomsCount = numberOfRooms
                    peopleVC.adultsCount = numberOfAdults
                    peopleVC.childsCount = numberOfChilds
                    print("yes!!!!")
                }
                
            }
        }else if segue.identifier == "showBudget"{
            if let secondNC = segue.destination as? UINavigationController{
                if let setConditionVC = secondNC.viewControllers.first as? SetConditionViewController{
                    //這邊可以讓後面的畫面傳值回來
                    setConditionVC.ratingDelegate = self
                    setConditionVC.starDelegate = self
//                    self.starArray = setConditionVC.stars
                    //這邊是讓前面的畫面可以傳到後面的畫面
                    setConditionVC.ratingValue = ratingValue
                }
            }
        }
    }
    
}

extension ViewController: RatingSliderDidScrolledDelegate, StarDidChosenDelegate{
    func starDidChosen(starDisChosen: String) {
        starValue = starDisChosen
    }
    
    
   
 
    func ratingSliderDidScrolled(sliderValue: Float) {
        print("get rating")
        ratingValue = sliderValue
        print(ratingValue)
        mainTableView.reloadData()
    }

    
}
