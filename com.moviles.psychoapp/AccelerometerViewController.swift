//
//  AccelerometerViewController.swift
//  com.moviles.psychoapp
//
//  Created by macuser on 10/8/17.
//  Copyright © 2017 Gustavo Adolfo Alegria Zu±iga. All rights reserved.
//

import UIKit
import CoreMotion

class AccelerometerViewController: UIViewController {
    
    
    var test: Test!
    var exam: Exam!
    
    

    @IBOutlet weak var countDownLabel: UILabel!
    var count = 10
    

    
    func update() {
        
        if(count >= 0){
            let minutes = String(count / 60)
            let seconds = String(count % 60)
            countDownLabel.text =  seconds
            count -= 1
        }
        
    }
    
    
    @IBOutlet weak var label: UILabel!
    
      var motion: CMMotionManager!
        var timer = Timer()
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        var timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(AccelerometerViewController.update), userInfo: nil, repeats: true)
        
        
        
        motion = CMMotionManager()
        
        print("va a hacer esto")
        
       
        startAccelerometers()
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func startAccelerometers() {
        
        print("Accelerometer started")
        // Make sure the accelerometer hardware is available.
        if self.motion.isAccelerometerAvailable {
            self.motion.accelerometerUpdateInterval = 1.0 / 60.0  // 60 Hz
            self.motion.startAccelerometerUpdates()
            
            // Configure a timer to fetch the data.
            self.timer = Timer(fire: Date(), interval: (1.0/60.0),
                               repeats: true, block: { (timer) in
                                // Get the accelerometer data.
                                if let data = self.motion.accelerometerData {
                                    self.label.text = "X:" + String(data.acceleration.x) +
                                        " Y:" + String(data.acceleration.y) +
                                        " Z:" + String(data.acceleration.z)

                                    
                                }
            })
            
            // Add the timer to the current run loop.
            RunLoop.current.add(self.timer, forMode: .defaultRunLoopMode)
        }
    }
    
    @IBAction func obtenerInfoAcelerometro() {
        
        if let accelerometerData = motion.accelerometerData{
            label.text = "X:" + String(accelerometerData.acceleration.x) +
                " Y:" + String(accelerometerData.acceleration.y) +
                " Z:" + String(accelerometerData.acceleration.z)
        }
        
    }
    
    
    
    @IBAction func send(_ sender: Any) {
        
        
        exam.testList.remove(at: 0)
        
        
        let data = exam
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller:TestViewController = storyboard.instantiateViewController(withIdentifier: "TestView") as! TestViewController
        controller.exam = data
        self.present(controller, animated: true, completion: nil)
        

    }
    

    
    
    
    

}
