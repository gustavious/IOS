//
//  TestViewController.swift
//  com.moviles.psychoapp
//
//  Created by macuser on 10/8/17.
//  Copyright © 2017 Gustavo Adolfo Alegria Zu±iga. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    var test: Test!
    var exam: Exam!
    
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelMaxScore: UILabel!
    @IBOutlet weak var labelWeight: UILabel!
    @IBOutlet weak var labelInstructions: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        test = exam.testList[0]

        
        // Do any additional setup after loading the view.
        
        
        labelName.text = test.name
        labelTime.text = test.time?.description
        labelWeight.text = test.weight?.description
        labelInstructions.text = test.instructions
        labelMaxScore.text = test.maxValue?.description
        
       
        
        
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

    @IBAction func takeTest(_ sender: Any) {
        
        
        
        if(exam.testList[0].privateId == "ACCELEROMETER"){
        
        self.performSegue(withIdentifier: "ShowAccelerometer", sender: exam)
        }
        
        else if( exam.testList[0].privateId == "QUESTION"){
            self.performSegue(withIdentifier: "ShowOpenQuestion", sender: exam)
        }

        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowAccelerometer"{
            
            
            let viewController: AccelerometerViewController = segue.destination as! AccelerometerViewController
            viewController.exam = sender as! Exam
            
            
        }
        else if segue.identifier == "ShowOpenQuestion"{
            
            
            let viewController: OpenQuestionViewController = segue.destination as! OpenQuestionViewController
            viewController.exam = sender as! Exam
            
            
        }
    }

}
