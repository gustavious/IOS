//
//  ViewController.swift
//  com.moviles.psychoapp
//
//  Created by Gustavo Adolfo Alegria Zu±iga on 29/09/17.
//  Copyright © 2017 Gustavo Adolfo Alegria Zu±iga. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    
    @IBAction func LogIn(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            
            if (error != nil){
                // create the alert
                let alert = UIAlertController(title: "Error", message: "Not valid credentials", preferredStyle: UIAlertControllerStyle.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)

            }
            else{
                
                self.validateTouchId()
                
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func validateTouchId (){
        
         let authenticationContext = LAContext()
        
        
        

  
        var error:NSError?
        
        // 2. Check if the device has a fingerprint sensor
        // If not, show the user an alert view and bail out!
        guard authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            
            showAlertViewIfNoBiometricSensorHasBeenDetected()
            return
            
        }
        
        // 3. Check the fingerprint
        authenticationContext.evaluatePolicy(
            .deviceOwnerAuthenticationWithBiometrics,
            localizedReason: "Only awesome people are allowed",
            reply: { [unowned self] (success, error) -> Void in
                
                if( success ) {
                    print ("Logueado papuh")
                    self.performSegue(withIdentifier: "ShowMainView", sender: self.email.text)
                    
                }else {
                    
                    // Check if there is an error
                    if error != nil {
                        
                        let message = "Touch ID auth error"
                        self.showAlertWithTitle(title: message,message: message)
                        
                    }
                    
                }
                
        })
        
        
        
        
        
        
    }
    
    
    

    func showAlertViewIfNoBiometricSensorHasBeenDetected(){
        
        showAlertWithTitle(title: "Error", message: "This device does not have a TouchID sensor.")
        
    }
    
    func showAlertWithTitle( title:String, message:String ) {
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertVC.addAction(okAction)
        
        self.present(alertVC, animated: true, completion: nil)
            

        
        
    }
    


}

