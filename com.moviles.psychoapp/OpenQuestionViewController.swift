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

    override func viewDidLoad() {
        super.viewDidLoad()

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
    @IBAction func send(_ sender: Any) {
        
        exam.testList.remove(at: 0)
        
        let data = exam
        let destinationViewController = TestViewController(nibName: "TestViewController", bundle: nil)
        destinationViewController.exam = data
        present(destinationViewController, animated: true, completion: nil)

    }

}
