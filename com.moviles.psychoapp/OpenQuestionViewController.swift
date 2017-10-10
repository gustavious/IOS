//
//  OpenQuestionViewController.swift
//  com.moviles.psychoapp
//
//  Created by macuser on 10/8/17.
//  Copyright © 2017 Gustavo Adolfo Alegria Zu±iga. All rights reserved.
//

import UIKit

class OpenQuestionViewController: UIViewController {
    
    
    var test: Test!
    var exam: Exam!
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var labelQuest: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if(test != nil){
        
        labelDesc?.text = test.instructions
        labelQuest?.text = test.name
        }
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
    @IBAction func send(_ sender: Any) {
        
        exam.testList.remove(at: 0)
        
        
        let data = exam
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller:TestViewController = storyboard.instantiateViewController(withIdentifier: "TestView") as! TestViewController
        controller.exam = data
        self.present(controller, animated: true, completion: nil)

    }

}
