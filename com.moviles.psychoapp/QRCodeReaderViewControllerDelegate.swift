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
        
        let key = ref.child("candidates").child(userID!).child("exams")
        
        let post = [id]
        let childUpdates = ["/candidates/\(userID)/exams/\(key)": post]
        ref.updateChildValues(childUpdates)
    
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        
            self.dismiss(animated: true, completion: nil)

    }

   
}
