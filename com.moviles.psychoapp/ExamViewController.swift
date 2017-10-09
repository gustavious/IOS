//
//  ExamViewController.swift
//  com.moviles.psychoapp
//
//  Created by macuser on 10/8/17.
//  Copyright © 2017 Gustavo Adolfo Alegria Zu±iga. All rights reserved.
//

import UIKit
import Firebase

class ExamViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
    
    var exam: Exam!
    var ref: DatabaseReference!
    
    var tests:[Test] = [Test]()
    
    
    @IBOutlet weak var labelCompany: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    
    
    
    @IBOutlet weak var testTable: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        testTable.delegate = self
        testTable.dataSource = self
       
        tests =  exam.testList
      
        labelName.text = exam.name
        labelCompany.text = exam.company
        labelDescription.text = exam.testDescription
    
        
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath)
        
        let currentTest: Test = tests[indexPath.row]
        
        let labelName: UILabel = cell.viewWithTag(1) as! UILabel
        labelName.text = currentTest.name!
     
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Clickea una celda")
        let selected: Test = tests[indexPath.row]
        
        self.performSegue(withIdentifier: "ShowTestView", sender: selected)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowTestView"{
            
            let viewController: TestViewController = segue.destination as! TestViewController
            viewController.test = sender as! Test
            
            
        }
    }


}
