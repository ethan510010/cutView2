//
//  StarArray.swift
//  CutView2
//
//  Created by EthanLin on 2018/3/13.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import Foundation

class StarArray {
    var starArray = [Star(starName:"1星",didTapped:false),Star(starName:"2星",didTapped:false),Star(starName:"3星",didTapped:false),Star(starName:"4星",didTapped:false),Star(starName:"5星",didTapped:false)]
    
}

class Star {
    var starName:String
    var didTapped:Bool
    init(starName:String, didTapped:Bool) {
        self.didTapped = didTapped
        self.starName = starName
    }
}
