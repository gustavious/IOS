
//
//  Test.swift
//  com.moviles.psychoapp
//
//  Created by macuser on 10/8/17.
//  Copyright © 2017 Gustavo Adolfo Alegria Zu±iga. All rights reserved.
//

import UIKit


class Test: NSObject {
    
    var id: String!
    var maxValue: Double?
    var time: Double?
    var weight: Double?
    var testDescription: String?
    var instructions: String?
    var name: String?
    var privateId: String?
    
    override init(){
        super.init()
    }
    
    
    convenience init(_ dict: Dictionary<String, AnyObject>) {
        
        self.init()
        print(dict)
        
        id = dict["id"] as! String!
        maxValue = dict["maxValue"] as! Double?
        time = dict["time"] as! Double?
        weight = dict["weight"] as! Double?
        testDescription = dict["testDescription"] as! String!
        instructions = dict["instructions"] as! String?
        name = dict["name"] as! String?
        privateId = dict["privateId"] as! String?
        
      
        
    }
}
