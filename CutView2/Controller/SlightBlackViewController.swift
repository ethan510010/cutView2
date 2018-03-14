//
//  SlightBlackViewController.swift
//  CutView2
//
//  Created by EthanLin on 2018/3/13.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

protocol ChildAgeSelectionDelegate {
    func whichAgeDidSelected(age:String)
}

class SlightBlackViewController: UIViewController {
    
    
    var delegate:ChildAgeSelectionDelegate?
    
    let ageForChild = ["<1歲","1歲","2歲","3歲","4歲","5歲","6歲","7歲","8歲","9歲","10歲","11歲","12歲","13歲","14歲","15歲","16歲","17歲"]
    
    @IBOutlet weak var whiteView: UIView!
    
    @IBOutlet weak var childAgeLabel: UILabel!
    
    @IBOutlet weak var agePicker: UIPickerView!
    
    @IBAction func ensureButton(_ sender: UIButton) {
        print(ageForChild[agePicker.selectedRow(inComponent: 0)])
        delegate?.whichAgeDidSelected(age: ageForChild[agePicker.selectedRow(inComponent: 0)])
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        whiteView.backgroundColor = .white
        
        //
        agePicker.delegate = self
        agePicker.dataSource = self
        
        
        //為了顯示半黑透明
        self.modalPresentationStyle = .custom
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension SlightBlackViewController:UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ageForChild.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ageForChild[row]
    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        print(ageForChild[row])
//    }
    
}
