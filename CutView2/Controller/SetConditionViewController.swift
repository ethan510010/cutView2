//
//  SetConditionViewController.swift
//  CutView2
//
//  Created by EthanLin on 2018/3/13.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit



protocol RatingSliderDidScrolledDelegate {
    func ratingSliderDidScrolled(sliderValue:Float)
}

protocol StarDidChosenDelegate{
    func starDidChosen(starDisChosen:String)
}


class SetConditionViewController: UIViewController {
    
    
    //星星部分
    var stars = StarArray()
    var starDidTap = ""
    @IBOutlet weak var starCollectionView: UICollectionView!
//    var starDidChosen = [false,false,false,false,false]
    
 
    //接收前面的畫面傳過來的值
    var ratingValue:Float?

    
    //設定delegate相關
    var starDelegate: StarDidChosenDelegate?
    var ratingDelegate: RatingSliderDidScrolledDelegate?
    
    
    @IBOutlet weak var guestRatingLabel: UILabel!
    
    @IBOutlet weak var ratingSlider: UISlider!
    
    @IBAction func backToMainView(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ratingAction(_ sender: UISlider) {
        //讓ratingSlider可以以每0.5前進一格
        let step:Float = 0.5
        ratingSlider.value = roundf(ratingSlider.value / step) * step
        //
        if ratingSlider.value == 0{
            guestRatingLabel.text = "Guest rating: All"
        }else if ratingSlider.value == 10{
            guestRatingLabel.text = "Guest rating: 10"
        }else{
            guestRatingLabel.text = "Guest rating: \(ratingSlider.value) or higher"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ratingSlider當前的值
        ratingSlider.value = 0
     
        //星星collectionView部分
        starCollectionView.delegate = self
        starCollectionView.dataSource = self
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ratingSlider.minimumValue = 0
        ratingSlider.maximumValue = 10
        
        //ratingSlider左邊的顏色
        ratingSlider.minimumTrackTintColor = .gray
        ratingSlider.maximumTrackTintColor = .blue
        
        //設定ratingSlider的值
        if let ratingValue = ratingValue {
            ratingSlider.setValue(ratingValue, animated: true)
        }
        
        //設定guestRatingLabel的值
        
        if ratingSlider.value == 0{
            guestRatingLabel.text = "Guest rating: All"
        }else if ratingSlider.value == 10{
            guestRatingLabel.text = "Guest rating: 10"
        }else{
            guestRatingLabel.text = "Guest rating: \(ratingSlider.value) or higher"
        }

        //ratingSlider的滾動單位
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ensureButton(_ sender: UIButton) {
        
        stars.starArray.forEach { star in
            
            if star.didTapped {
                starDidTap += star.starName
            }
        }
        
        starDelegate?.starDidChosen(starDisChosen: starDidTap)
        ratingDelegate?.ratingSliderDidScrolled(sliderValue: ratingSlider.value)
        dismiss(animated: true, completion: nil)
    }
}

extension SetConditionViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stars.starArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let starCell = collectionView.dequeueReusableCell(withReuseIdentifier: "starCell", for: indexPath) as! StarCollectionViewCell
        starCell.starLabel.text = stars.starArray[indexPath.row].starName
        if stars.starArray[indexPath.row].didTapped == true{
            
            starCell.starLabel.layer.borderWidth = 0
            starCell.starLabel.backgroundColor = .orange
            starCell.starLabel.layer.borderColor = UIColor.clear.cgColor
        }else{
            
            starCell.starLabel.layer.borderWidth = 1
            starCell.starLabel.backgroundColor = .clear
            starCell.starLabel.layer.borderColor = UIColor.gray.cgColor
        }
        return starCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        stars.starArray[indexPath.row].didTapped = !stars.starArray[indexPath.row].didTapped
//        starDidChosen[indexPath.row] = stars.starArray[indexPath.row].didTapped
       
        collectionView.reloadData()
    }
    
    
}
