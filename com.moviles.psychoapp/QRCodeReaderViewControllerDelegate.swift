	//
//  QRCodeReaderViewControllerDelegate.swift
//  com.moviles.psychoapp
//
//  Created by macuser on 10/8/17.
//  Copyright © 2017 Gustavo Adolfo Alegria Zu±iga. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftQRCode
import Firebase
    

class QRCodeReaderViewControllerDelegate: UIViewController	 {
    
    var ref: DatabaseReference!


    let scanner = QRCode()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        ref = Database.database().reference()
        
       
    
        
        // self.addTest(id: "-KvyJ712CdQbM-penwz5")
        
        //self.addTest(id: "-Kvy13dJ-eaU7kMU1Hdb")
        
        scanner.prepareScan(view) { (stringValue) -> () in
            print(stringValue)
            self.addTest(id: stringValue)
            self.dismiss(animated: true, completion: nil)
            
            
        }
        scanner.scanFrame = view.bounds

        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // start scan
        scanner.startScan()
    }
    
    
    func addTest(id:String){
        
        let userID = Auth.auth().currentUser?.uid
        
      //  let key = ref.child("candidates").child(userID!).child("exams").key
        ref.child("candidates").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            
            let value = snapshot.value as! NSDictionary
            let exams = value["exams"] as? NSDictionary
            
            if(exams == nil){
                self.ref.child("candidates").child(userID!).setValue(["exams" : [id: [ "date":"02/10/2017"]]])
            }
            else{
            
            
            exams?.setValue([ "date": "02/10/2017"], forKey: id)
            
              print(exams)
            
            let childUpdates = ["/candidates/\(userID!)/exams/": exams]
            self.ref.updateChildValues(childUpdates)
            
        }

        

        }) { (error) in
            print(error.localizedDescription)
        }
        
        
    }
    @IBAction func quit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
   
   
}
