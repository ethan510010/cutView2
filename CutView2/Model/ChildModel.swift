//
//  ChildModel.swift
//  CutView2
//
//  Created by EthanLin on 2018/3/14.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import Foundation


class Children{
    var childArray = [Child]()
}


class Child {
    var childName: String
    var childAge:String
    init(childName:String, childAge:String) {
        self.childAge = childAge
        self.childName = childName
    }
}
