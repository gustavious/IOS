//
//  Exam.swift
//  com.moviles.psychoapp
//
//  Created by macuser on 10/8/17.
//  Copyright © 2017 Gustavo Adolfo Alegria Zu±iga. All rights reserved.
//

import UIKit
import Firebase


class Exam: NSObject {
    
    var id: String!
    var date: String?
    var employer: String?
    var maxScore: Double?
    var name: String?
    var score: Double?
    var time: Double?
    
    
    var testDescription: String?
    var company: String?
    var title: String?
    var user: String?
    var username: String?
    var testList:[Test] = [Test]()
    
    var ref: DatabaseReference!
    
    
    override init(){
        super.init()
    }
    
    
    convenience init(_ dict: Dictionary<String, AnyObject>) {
        
        self.init()
       // print(dict)
        
        id = dict["id"] as! String!
        date = dict["date"] as! String?
        employer = dict["employer"] as! String?
        maxScore = dict["maxScore"] as! Double?
        name = dict["name"] as! String?
        score = dict["score"] as! Double?
        time = dict["time"] as! Double?
        
        
        testDescription = dict["description"] as! String!
        company = dict["company"] as! String?
        title = dict["title"] as! String?
        user = dict["user"] as! String?
        username = dict["username"] as! String?
        
        
    }
    
   

}
